//
//  StoreListViewController.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

class StoreListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = StoreListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fillViewModelsArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        title = "Store List"
        tableView.register(UINib(nibName: ButtonTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: ButtonTableViewCell.cellIdentifier())
        tableView.register(UINib(nibName: PharmacyTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: PharmacyTableViewCell.cellIdentifier())
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    /**
     Go to cart button tapped
     
     - parameter sender: goToCartButton
     */
    @IBAction func goToCartButtonTapped(_ sender: Any) {
        
    }
}

//MARK: - ButtonCellDelegate
extension StoreListViewController: ButtonCellDelegate {
    func buttonTapped(cell: ButtonTableViewCell) {
        
    }
}

//MARK: - ButtonCellDelegate
extension StoreListViewController: PharmacyCellDelegate {
    func cellTapped(cell: PharmacyTableViewCell) {
        
    }
}

//MARK: - UITableViewDelegate
extension StoreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PharmacyTableViewCell {
           
            let viewController = CartViewController(viewModel: <#T##CartViewModel#>)
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - UITableViewDataSource
extension StoreListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let cellViewModel = viewModel.viewModelForIndexPath(indexPath) as? ButtonCellViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.cellIdentifier(), for: indexPath) as! ButtonTableViewCell
            cell.configureWith(dataSource: cellViewModel, andDelegate: self)
            return cell
        }
        else if let cellViewModel = viewModel.viewModelForIndexPath(indexPath) as? PharmacyCellViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: PharmacyTableViewCell.cellIdentifier(), for: indexPath) as! PharmacyTableViewCell
            cell.configureWith(dataSource: cellViewModel, andDelegate: self)
            return cell
        }
        
        return cell
    }
}
