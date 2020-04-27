//
//  ViewController.swift
//  Davaleba 9
//
//  Created by Kote Ghudushauri on 4/27/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var InputText1: UITextField!
    
    @IBOutlet weak var InputText2: UITextField!
    
    @IBOutlet weak var InputText3: UITextField!
    
    @IBOutlet weak var InputText4: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if 10 > 1 {
        
        let kote1 = InputText1.text ?? ""
        let kote2 = InputText2.text ?? ""
        let kote3 = InputText3.text ?? ""
        let kote4 = InputText4.text ?? ""
            
        if let secondVC = segue.destination as? SecondScreenViewController{
            secondVC.text1 = kote1
            secondVC.text2 = kote2
            secondVC.text3 = kote3
            secondVC.text4 = kote4
            }
        }
            
            
            
            
        }
        
        
    
    }
        


