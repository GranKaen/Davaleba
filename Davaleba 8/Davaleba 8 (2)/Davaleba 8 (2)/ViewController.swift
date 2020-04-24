//
//  ViewController.swift
//  Davaleba 8 (2)
//
//  Created by Kote Ghudushauri on 4/24/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func SignIn(_ sender: Any) {
        let aleert = UIAlertController(title: "SIGN IN", message: "Good Job", preferredStyle:  .alert)
        
        aleert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        
        self.present(aleert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

