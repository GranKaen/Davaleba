//
//  SecondScreenViewController.swift
//  Davaleba 9
//
//  Created by Kote Ghudushauri on 4/27/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    var text1: String?
    var text2: String?
    var text3: String?
    var text4: String?
    
    @IBOutlet weak var Lable1: UILabel!
    
    @IBOutlet weak var Lable2: UILabel!
    
    @IBOutlet weak var Lable3: UILabel!
    
    @IBOutlet weak var Lable4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Lable1.text = text1
        Lable2.text = text2
        Lable3.text = text3
        Lable4.text = text4
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
