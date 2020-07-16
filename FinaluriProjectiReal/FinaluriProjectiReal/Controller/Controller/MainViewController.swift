//
//  MainViewController.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    var recip: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selectedIndex = 0
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    

    

}
