//
//  CartViewController.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

class CartViewController: BaseViewController {

    var name: String?
    var direction: String?
    var shippingCost: Int?
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var pharmacyDirection: UILabel!
    @IBOutlet weak var pharmacyName: UILabel!
    @IBOutlet weak var pharmacyShippingCost: UILabel!
    @IBOutlet weak var subTotalLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var viewButton: UIView!
    
    var viewModel: CartViewModel
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CartViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cartTableView.delegate = self
        cartTableView.dataSource = self
        viewModel.fillViewModelArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cartTableView.register(UINib(nibName: CartTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CartTableViewCell.cellIdentifier())
        if let name = name, let direction = direction, let shippingCost = shippingCost {
            pharmacyName.text = name
            pharmacyDirection.text = direction
            pharmacyShippingCost.text = "$\(shippingCost)"
            totalLabel.text = "Costo de envío: $\(viewModel.subtotal + shippingCost)"
        }
        subTotalLabel.text = "Subtotal: $\(viewModel.subtotal)"
        viewButton.clipsToBounds = true
        viewButton.layer.cornerRadius = 4
    }
    
    //MARK: - Actions
    
    /**
     Go back to order confirmation button tapped
     
     - parameter sender: goToOrderConfirmationButton
     */
    @IBAction func goToOrderConfirmationButtonTapped(_ sender: UIButton) {
        let viewController = OrderConfirmationViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /**
     Go to payment method button tapped
     
     - parameter sender: goToPaymentMethodButton
     */
    @IBAction func goToPaymentMethodButtonTapped(_ sender: UIButton) {
        let viewController = PaymentMethodViewController()
        present(viewController, animated: true, completion: nil)
    }
}

//MARK: - CartCellDelegate

extension CartViewController: CartCellDelegate {
    func minusButtonTapped(cell: CartTableViewCell) {
        print(viewModel.decreaseButtonTapped(cell: cell))
        subTotalLabel.text = "Subtotal: $\(viewModel.decreaseButtonTapped(cell: cell))"
        if let shippingCost = shippingCost {
            totalLabel.text = "$\(viewModel.subtotal + shippingCost)"
        }
    }
    
    func plusButtonTapped(cell: CartTableViewCell) {
        subTotalLabel.text = "Subtotal: $\(viewModel.increaseButtonTapped(cell: cell))"
        if let shippingCost = shippingCost {
            totalLabel.text = "$\(viewModel.subtotal + shippingCost)"
        }
    }
}

//MARK: - UITableViewDataSource

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = viewModel.viewModelForIndexPath(indexPath) as? CartCellViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.cellIdentifier()) as! CartTableViewCell
            cell.configureWith(dataSource: cellViewModel, andDelegate: self)
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
}

//MARK: - UITableViewDelegate

extension CartViewController: UITableViewDelegate {
  
}
