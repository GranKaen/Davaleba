//
//  addrecipeViewController.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import CoreData

class addrecipeViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate{

    var recip = [Recipes]()
     var isEditingArticle = false
       var articleIndex = -1
    
    
    @IBOutlet var addimage: UIImageView!{
        didSet{
            addimage.layer.cornerRadius = addimage.frame.height/2
        }
    }
    @IBOutlet var addnamefield: UITextField!
    @IBOutlet var addStepOne: UITextView!
    @IBOutlet var addStepTwo: UITextView!
    @IBOutlet var addStepThree: UITextView!
    @IBOutlet var addTip: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTapped))
        addimage.isUserInteractionEnabled = true
        addimage.addGestureRecognizer(tapGesture)
        
    }
    
    
    
     @objc func onImageTapped() {
           imagePicker.delegate = self
           imagePicker.allowsEditing = true
           imagePicker.sourceType = .photoLibrary
           self.present(imagePicker, animated: true)
       }
       private func publishPost() {
           let context = AppDelegate.viewContext
           let post = Recipes(context: context)
           
           post.recipeName = addnamefield.text
           post.step1 = addStepOne.text
           post.step2 = addStepTwo.text
           post.step3 = addStepThree.text
           post.tips = addTip.text
           post.recipeImage = addimage.image?.pngData()
           recip.append(post)
           do {
               try context.save()
           } catch {}
       }
    
    
    
    func getArticleIndex(index: Int) {
        articleIndex = index
        isEditingArticle = true
        
        let article = recip[index]
        
        addnamefield.text = article.recipeName
        addStepOne.text = article.step1
        addStepTwo.text = article.step2
        addStepThree.text = article.step3
        addTip.text = article.tips
    }
    
    
    
    
    @IBAction func onAdd(_ sender: UIButton) {
    publishPost()
    navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    

}
extension addrecipeViewController{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            self.addimage.image = image
        }
        
        self.dismiss(animated: true)
    }
    
    
}
