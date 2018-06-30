//
//  PaymentMethodViewController.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

class PaymentMethodViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Actions
    
    /**
     Back button tapped
     
     - parameter sender: backButton
     */
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /**
     Card payment method button tapped
     
     - parameter sender: cardPaymentMethod
     */
    @IBAction func cardPaymentMethodTapped(_ sender: Any) {
    }
    
    /**
     Cash payment method button tapped
     
     - parameter sender: cashPaymentMethodButton
     */
    @IBAction func cashPaymentMethodButtonTapped(_ sender: Any) {
    }

}
