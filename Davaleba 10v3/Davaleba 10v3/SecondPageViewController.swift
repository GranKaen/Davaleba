//
//  SecondPageViewController.swift
//  Davaleba 10v3
//
//  Created by Kote Ghudushauri on 4/28/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {

    @IBOutlet weak var PriceLable: UILabel!
    @IBOutlet weak var QuantityLable: UILabel!
    var Pricevar: String?
    var Quantityvar: String?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PriceLable.text = Pricevar
        QuantityLable.text = Quantityvar
        
    }
    

    

}
