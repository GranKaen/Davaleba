//
//  AddFileViewController.swift
//  Davaleba folderebis sheqmna
//
//  Created by Kote Ghudushauri on 5/11/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class AddFileViewController: UIViewController {
    @IBOutlet weak var addedfilename: UITextField!
    @IBOutlet weak var addedfilecontext: UITextView!
    @IBOutlet weak var buttonname: UIButton!
    var folder: String?
    var fileToEdit: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonname.setTitle("Add", for: .normal)
        if fileToEdit != nil{
            addedfilename.isUserInteractionEnabled = false
            buttonname.setTitle("Edit", for: .normal)
            let file = fileToEdit ?? ""
            addedfilename.text = file.components(separatedBy: ".")[0]
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addfilebutton(_ sender: UIButton) {
         let filmanager = CustomFileManager.shared
               filmanager.addFile(text: addedfilecontext.text ?? "", name: addedfilename.text ?? "",folder: folder ?? "" )
               if fileToEdit != nil{
                   self.navigationController?.popViewController(animated: true)
               }
        
        
        
    }
    
   

}
