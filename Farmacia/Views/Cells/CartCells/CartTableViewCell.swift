//
//  CartTableViewCell.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/29/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

protocol CartCellDataSource {
    var productName: String { get }
    var productPrice: Int { get }
    var quantity: Int { get }
}

protocol CartCellDelegate {
    func minusButtonTapped(cell: CartTableViewCell)
    func plusButtonTapped(cell: CartTableViewCell)
}

class CartTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    private var delegate: CartCellDelegate?
    private var dataSource: CartCellDataSource!
    
    var quantityNumber = 0
    var unitPrice = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Actions
    @IBAction func minusButton(_ sender: UIButton) {
        if quantityNumber - 1 > 0 {
            decreaseQuantity()
            delegate?.minusButtonTapped(cell: self)
        }
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        increaseQuantity()
        delegate?.plusButtonTapped(cell: self)
    }
    
    /**
     Configure a cell with its datasource and delegate
     
     - parameter dataSource: CartCellDataSource
     - parameter delegate: CartCellDelegate
     */
    func configureWith(dataSource: CartCellDataSource, andDelegate delegate: CartCellDelegate?) {
        configureCellWith(dataSource: dataSource)
        configureWith(delegate: delegate)
    }
    
    //MARK: - Private methods

    /**
     Configure a cell with its datasource
     
     - parameter dataSource: CartCellDataSource
     */
    private func configureCellWith(dataSource: CartCellDataSource) {
        self.dataSource = dataSource
        productName.text = dataSource.productName
        quantityNumber = dataSource.quantity
        quantity.text = String(quantityNumber)
        unitPrice = dataSource.productPrice
        productPrice.text = "$\(unitPrice)"
        
    }
    
    /**
     Configure a cell with its delegate
     
     - parameter delegate: CartCellDelegate
     */
    private func configureWith(delegate: CartCellDelegate?) {
        self.delegate = delegate
    }
    
    /**
     Decrease the number of products in the cart
     */
    private func decreaseQuantity() {
        quantityNumber -= 1
        quantity.text = String(quantityNumber)
    }
    
    /**
     Increase the number of products in the cart
     */
    private func increaseQuantity() {
        quantityNumber += 1
        quantity.text = String(quantityNumber)
    }
}
