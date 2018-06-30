//
//  PharmacyCellViewModel.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/28/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import Foundation
import UIKit

class PharmacyCellViewModel: BaseViewModel, PharmacyCellDataSource {
    
    var pharmacyDirection: String
    var pharmacyImage: UIImage
    var pharmacyName: String
    var pharmacyShippingCost: Int

    init(direction: String, image: UIImage, name: String, shippingCost: Int) {
        pharmacyDirection = direction
        pharmacyImage = image
        pharmacyName = name
        pharmacyShippingCost = shippingCost
    }
}
