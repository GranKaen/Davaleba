//
//  TabBarController.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/16/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 0
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
   
    

}
