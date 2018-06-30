//
//  SplashViewController.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/22/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

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
     Go to Store List button tapped
     
     - parameter sender: goToStoreListButton
    */
    @IBAction func goToStoreListTapped(_ sender: UIButton) {
        let viewController = StoreListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: false, completion: nil)
    }
    
}
