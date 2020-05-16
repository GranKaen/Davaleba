//
//  ViewController.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/15/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var scrolviewlogin: UIScrollView!
    @IBOutlet weak var usernameLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    var result = NSArray()
    var users = [User]()
    var user = User()
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchPosts()
    }

    @IBAction func signinlogin(_ sender: UIButton) {
        
        
        
        var username = ""
        var passString = ""
        var checkRecord = false
        for item in users {
           username = item.value(forKeyPath: "username") as! String
           passString = item.value(forKeyPath: "password") as! String
           if username == usernameLogin.text && passwordLogin.text == passString
           {
            user = item
                checkRecord = true;
           }
        }
        if checkRecord == true
        {
           let homeVC = storyboard?.instantiateViewController(identifier: "tabbar_id") as! TabBarController
            homeVC.user = self.user
            navigationController?.pushViewController(homeVC, animated: true)
        }
        else
        {
            alert(title: "Error", message: "Please create an account")
        }
        
        
        
        
        
    }
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ":)", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func signuplogin(_ sender: UIButton) {
    
        let registrationVC = storyboard?.instantiateViewController(identifier: "register_id") as! RegisterViewController
        navigationController?.pushViewController(registrationVC, animated: true)
        
        
    }
    
   
     private func fetchPosts() {
        let context = AppDelegate.viewContext
           
           let request: NSFetchRequest<User> = User.fetchRequest()
           
           do {
               let users = try context.fetch(request)
               self.users.removeAll()
               self.users.append(contentsOf: users)
       
           } catch {}
       }
       
    
    
    
}

