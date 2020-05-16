//
//  SettingsVC.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/16/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutsettings(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}
