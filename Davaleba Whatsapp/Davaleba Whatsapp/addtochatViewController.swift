//
//  addtochatViewController.swift
//  Davaleba Whatsapp
//
//  Created by Kote Ghudushauri on 5/7/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

protocol getmessage {
    func newmessage(message: message)
}

class addtochatViewController: UIViewController {

    @IBOutlet weak var addname: UITextField!
    @IBOutlet weak var addtext: UITextView!
    
    var messagedelegate:getmessage?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addchatbutton2(_ sender: UIButton) {
        let newname = addname.text ?? ""
        let newtext = addtext.text ?? ""
        let newmessage = message(name: newname, atext: newtext)
        messagedelegate?.newmessage(message: newmessage)
    }
    

}


