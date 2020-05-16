//
//  RegisterViewController.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/15/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class RegisterViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var scrollviewregister: UIScrollView!
    
    @IBOutlet weak var profilepicregister: UIImageView!
    
    @IBOutlet weak var usernameregister: UITextField!
    
    @IBOutlet weak var passwordregister: UITextField!
    
    @IBOutlet weak var firstnameregister: UITextField!
    
    @IBOutlet weak var lastnameregister: UITextField!
    
    @IBOutlet weak var mailregister: UITextField!
    var users = [User]()
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTapped))
        profilepicregister.isUserInteractionEnabled = true
        profilepicregister.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchPosts()
    }
    
    @objc func onImageTapped() {
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    imagePicker.sourceType = .photoLibrary
    self.present(imagePicker, animated: true)
    }
        
    @IBAction func signupregister(_ sender: UIButton) {
        
        var username = ""
        var checkRecord = false
        for item in users {
            username = item.value(forKeyPath: "username") as! String
            if username == usernameregister.text
            {
                checkRecord = true;
            }
        }
        if checkRecord == true
        {
            alert(title: "Error", message: "egeti user arsebobs")
        }
        else
        {
            registerUser()
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    
    private func registerUser() {
        let context = AppDelegate.viewContext
        let user = User(context: context)
        
        user.firstname          = firstnameregister.text ?? ""
        user.lastname       = lastnameregister.text ?? ""
        user.mail         = mailregister.text ?? ""
        user.username      = usernameregister.text ?? ""
        user.password      = passwordregister.text ?? ""
        if let binaryImage = profilepicregister.image?.pngData() {
            user.profilepicture     = binaryImage
        }
        
        do {
            try context.save()
        } catch {}
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
    
    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ":)", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    

}


extension RegisterViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.profilepicregister.image = image
        }
        
        self.dismiss(animated: true)
    }
}
