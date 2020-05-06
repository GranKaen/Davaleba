//
//  register.swift
//  Davaleba login+register+profile
//
//  Created by Kote Ghudushauri on 5/6/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class register: UIViewController {
    
    @IBOutlet weak var usernameregField: UITextField!
    @IBOutlet weak var MailRegfield: UITextField!
    @IBOutlet weak var passwordregField: UITextField!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createprofile() {
        UserDefaults.standard.setValue(usernameregField.text ?? "", forKey: "username")
        UserDefaults.standard.setValue(MailRegfield.text ?? "", forKey: "mail")
        UserDefaults.standard.setValue(passwordregField.text ?? "", forKey: "password")
    }
    
    
    @IBAction func onregistertapped(_ sender: Any) {
        createprofile()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
