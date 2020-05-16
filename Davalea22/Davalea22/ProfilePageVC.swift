//
//  ProfilePageVC.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/16/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ProfilePageVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var profilepicprofile: UIImageView!
    
    @IBOutlet weak var nameprofile: UITextField!
    
    @IBOutlet weak var lastnameprofile: UITextField!
    
    @IBOutlet weak var usernameprofile: UITextField!
    
    @IBOutlet weak var passwordprofile: UITextField!
    
    @IBOutlet weak var mailprofile: UITextField!
    
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTapped))
        profilepicprofile.isUserInteractionEnabled = true
        profilepicprofile.addGestureRecognizer(tapGesture)
        
        navigationController?.isNavigationBarHidden = true
        let tabBar = self.tabBarController as? TabBarController
        let user = tabBar?.user
        profilepicprofile.image = UIImage(data: user!.profilepicture!)
        nameprofile.text = user?.firstname
        lastnameprofile.text = user?.lastname
        usernameprofile.text = user?.username
        passwordprofile.text = user?.password
        mailprofile.text = user?.mail
        
        
    }
    

    
       
     
     private func registerUser() {
         let context = AppDelegate.viewContext
         let tabBar = self.tabBarController as? TabBarController
         let user = tabBar?.user
         
        user!.firstname = nameprofile.text ?? ""
         user!.lastname  = lastnameprofile.text ?? ""
         user!.mail    = mailprofile.text ?? ""
         user!.username = usernameprofile.text ?? ""
         user!.password = passwordprofile.text ?? ""
         if let binaryImage = profilepicprofile.image?.pngData() {
             user!.profilepicture = binaryImage
         }
         
         do {
             try context.save()
         } catch {}
     }
     
     
    
    @objc func onImageTapped() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }

}



extension ProfilePageVC {
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.editedImage] as? UIImage {
        self.profilepicprofile.image = image
    }
    
    self.dismiss(animated: true)
    }
}
