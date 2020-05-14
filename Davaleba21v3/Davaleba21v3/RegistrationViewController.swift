//
//  RegistrationViewController.swift
//  Davaleba21v3
//
//  Created by Kote Ghudushauri on 5/14/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class RegistrationViewController: UIViewController {
    @IBOutlet weak var regname: UITextField!
    @IBOutlet weak var regpassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func regbutton(_ sender: UIButton) {
    signUp_data()
    self.navigationController?.popViewController(animated: true)
    }
    func signUp_data() {
        let context = AppDelegate.coreDataContainer.viewContext
        let user = User(context: context)
        user.name = regname.text!
        user.password = regpassword.text!
        do {
            try context.save()
        } catch {}
    }
}
