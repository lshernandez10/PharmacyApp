//
//  OrderConfirmationViewController.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    /**
     Finish button tapped
     
     - parameter sender: finishButton
     */
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
