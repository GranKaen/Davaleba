//
//  ViewController.swift
//  Davaleba login+register+profile
//
//  Created by Kote Ghudushauri on 5/6/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nammefield: UITextField!
    
    @IBOutlet weak var passwordfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if SaveSystem.notclicked() {
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "profile_id") as! profile
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
        
    }
    @IBAction func onregistertapped(_ sender: Any) {
        let registrationVC = storyboard?.instantiateViewController(withIdentifier: "register_id") as! register
        self.navigationController?.pushViewController(registrationVC, animated: true)
    }
    @IBAction func onLogintapped(_ sender: Any) {
        if (nammefield.text ?? "" == (UserDefaults.standard.string(forKey: "username") ?? "" )) && (passwordfield.text ?? "" == (UserDefaults.standard.string(forKey: "password") ?? "")){
            
            let profileVC = storyboard?.instantiateViewController(withIdentifier: "profile_id") as! profile
            self.navigationController?.pushViewController(profileVC, animated: true)
            
        }
        else {
            print("alerti ver movaswari(kappa)")
            
            }
        }
    }
    



