//
//  viewpage.swift
//  Davaleba 18v2
//
//  Created by Kote Ghudushauri on 5/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class viewpage: UIViewController {
    
    @IBOutlet weak var fulltext: UITextView!
    
    var textforfull: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        fulltext.text = textforfull
        // Do any additional setup after loading the view.
    }
    

    

}
