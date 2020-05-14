//
//  ViewController.swift
//  Davaleba21v3
//
//  Created by Kote Ghudushauri on 5/14/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var nameLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    var tempUsername = [String]()
    var tempPassword = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginButton(_ sender: UIButton) {
        fetchUser()
        var k = 0
        var showAlert = true
        while k < tempUsername.count {
            if nameLogin.text == tempUsername[k] && passwordLogin.text == tempPassword[k] {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let  VC = storyboard.instantiateViewController(identifier: "note_id")
                showAlert = false
                self.navigationController?.pushViewController(VC, animated: true)
                break}
            k += 1}
        if showAlert {
          alert(title: "Error!", message: "Check Username and password")
        }
    }
    @IBAction func registerButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "register_id")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try context.fetch(request)
            for item in users {
                tempUsername.append(item.name ?? "")
            }
            for item in users {
                tempPassword.append(item.password ?? "")
            }
        } catch {}
    }
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ":)", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

