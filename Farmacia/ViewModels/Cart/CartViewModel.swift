//
//  CartViewModel.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import Foundation

class CartViewModel: BaseViewModel {
    var viewModelArray = [[Any]]()
    var subtotal = 0
    
    init(pharmacy: Pharmacy) {
        super.init()
        
    }
    
    //MARK: - public methods
    
    /**
     Decrease the cart subtotal with the given quantity
     
     - parameter cell: CartTableViewCell
     */
    func decreaseButtonTapped(cell: CartTableViewCell) -> Int {
        subtotal -= cell.unitPrice
        print("Subtotal decrease \(cell.unitPrice)")
        return subtotal
    }
    
    /**
     Fill view model array
     */
    func fillViewModelArray(){
        let products = [
            CartCellViewModel(productName: "Caja Ibuprofeno", productPrice: 15000, quantity: 1),
            CartCellViewModel(productName: "Caja Acetaminofen", productPrice: 12000, quantity: 1),
            CartCellViewModel(productName: "Frasquito Dolex", productPrice: 8000, quantity: 1)
        ]
        viewModelArray.append(products)
        initialSubtotal(cartCellArray: products)
    }
    
    /**
     Increase the cart subtotal with the given quantity
     
     - parameter cell: CartTableViewCell
    */
    func increaseButtonTapped(cell: CartTableViewCell) -> Int {
        subtotal += cell.unitPrice
        print("Subtotal increase \(cell.unitPrice)")
        return subtotal
    }
    
    /**
     Number of sections in a table
     */
    func numberOfSections() -> Int {
        return viewModelArray.count
    }
    
    /**
     Number of rows in a table section
     
     - parameter section: section
     */
    func numberOfRowsInSection(section: Int) -> Int {
        return viewModelArray[section].count
    }
    
    /**
     View model for a given indexPath
     
     - parameter indexPath: indexPath
     */
    func viewModelForIndexPath(_ indexPath: IndexPath) -> Any {
        return viewModelArray[indexPath.section][indexPath.row]
    }
    
    //MARK: - Private methods
    
    /**
     Calculate the initial cart subtotal
    */
    private func initialSubtotal(cartCellArray: [CartCellViewModel]) {
        for cartCell in cartCellArray {
            subtotal += cartCell.quantity*cartCell.productPrice
        }
    }
}
