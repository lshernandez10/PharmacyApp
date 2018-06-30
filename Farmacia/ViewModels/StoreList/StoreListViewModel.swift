//
//  StoreListViewModel.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import Foundation
import UIKit

class StoreListViewModel: BaseViewModel {
    var viewModelArray = [[Any]]()
    
    //MARK: - public methods
    
    /**
     Fill view model array
    */
    func fillViewModelsArray() {
        let buttonSection = [ButtonCellViewModel(buttonText: "Promociones"), ButtonCellViewModel(buttonText: "Farmacias Cercanas")]
        let pharmacies = [
            PharmacyCellViewModel(direction: "Calle 1", image: UIImage(named: "farmacia")!, name: "Farmatodo", shippingCost: 3000),
            PharmacyCellViewModel(direction: "Calle 2", image: UIImage(named: "farmacia2")!, name: "Drogueria exito", shippingCost: 2500),
            PharmacyCellViewModel(direction: "Calle 3", image: UIImage(named: "farmacia3")!, name: "Drogas la rebaja", shippingCost: 2000),
            PharmacyCellViewModel(direction: "Calle 4", image: UIImage(named: "farmacia")!, name: "La estrella", shippingCost: 1000),
            PharmacyCellViewModel(direction: "Calle 5", image: UIImage(named: "farmacia2")!, name: "farmacia 5", shippingCost: 0),
            PharmacyCellViewModel(direction: "Calle 6", image: UIImage(named: "farmacia3")!, name: "Farmatodo", shippingCost: 1500),
            PharmacyCellViewModel(direction: "Calle 7", image: UIImage(named: "farmacia")!, name: "Drogueria exito", shippingCost: 3000),
            PharmacyCellViewModel(direction: "Calle 8", image: UIImage(named: "farmacia2")!, name: "Drogas la rebaja", shippingCost: 2500),
            PharmacyCellViewModel(direction: "Calle 9", image: UIImage(named: "farmacia3")!, name: "La estrella", shippingCost: 2000),
            PharmacyCellViewModel(direction: "Calle 10", image: UIImage(named: "farmacia")!, name: "farmacia 5", shippingCost: 1000),
            PharmacyCellViewModel(direction: "Calle 11", image: UIImage(named: "farmacia2")!, name: "Farmatodo", shippingCost: 0),
            PharmacyCellViewModel(direction: "Calle 12", image: UIImage(named: "farmacia3")!, name: "Drogueria exito", shippingCost: 3000),
            PharmacyCellViewModel(direction: "Calle 13", image: UIImage(named: "farmacia")!, name: "Drogas la rebaja", shippingCost: 2500),
            PharmacyCellViewModel(direction: "Calle 14", image: UIImage(named: "farmacia2")!, name: "La estrella", shippingCost: 2000),
            PharmacyCellViewModel(direction: "Calle 15", image: UIImage(named: "farmacia3")!, name: "farmacia 5", shippingCost: 1000)
        ]
        viewModelArray.append(buttonSection)
        viewModelArray.append(pharmacies)
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
}
