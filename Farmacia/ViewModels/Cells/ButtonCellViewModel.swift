//
//  ButtonCellViewModel.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/27/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import Foundation

class ButtonCellViewModel: BaseViewModel, ButtonCellDataSource {
    var buttonText: String
    
    init(buttonText: String) {
        self.buttonText = buttonText
    }
}
