//
//  ViewController.swift
//  Davaleba 10v3
//
//  Created by Kote Ghudushauri on 4/28/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ProductName: UITextField!
    @IBOutlet weak var PriceField: UITextField!
    @IBOutlet weak var QuantityField: UITextField!
    
    @IBOutlet weak var Kutxe: UILabel!
    
    var i = 0
    var k = 0
    var o = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func Add(_ sender: UIButton) {
        
        
        let check = ProductName.text
               if (check! == "" || Int(QuantityField.text!) == nil || Int(PriceField.text!) == nil) {
                   let alert = UIAlertController(title: "Opsss...", message: "Name-String, Price and Quantoty-Int. Dont Forget :)", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: ":)", style: .default))
                   self.present(alert, animated: true, completion: nil)         }
               else {
                   i += 1
                   let Kutxelet = String(i)
                    Kutxe.text = Kutxelet
                let Price = Int(PriceField.text!)!
                let Quantity = Int(QuantityField.text!)!
                   k += Price * Quantity
                   o += Quantity
                   
               }
           }
        
        
    
    
    @IBAction func Calculate(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segue_for_second_page", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SecondVC = segue.destination as? SecondPageViewController{
            
            SecondVC.Pricevar = String(k)
            SecondVC.Quantityvar = String(o)
            
        }
    }
    
    
    

}

