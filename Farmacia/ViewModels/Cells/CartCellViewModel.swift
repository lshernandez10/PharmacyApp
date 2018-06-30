//
//  CartCellViewModel.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/29/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import Foundation

class CartCellViewModel: BaseViewModel, CartCellDataSource {
    
    var productName: String
    var productPrice: Int
    var quantity: Int
    
    init(productName: String, productPrice: Int, quantity: Int) {
        self.productName = productName
        self.productPrice = productPrice
        self.quantity = quantity
    }
}
