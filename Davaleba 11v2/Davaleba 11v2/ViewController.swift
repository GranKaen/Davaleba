//
//  ViewController.swift
//  Davaleba 11v2
//
//  Created by Kote Ghudushauri on 4/29/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Fname: UITextField!
    @IBOutlet weak var Lname: UITextField!
    @IBOutlet weak var Mail: UITextField!
    @IBOutlet weak var Gender: UITextField!
    
    var User = [register]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func SignIn(_ sender: Any) {
        signin()
    }
    func signin(){
        let Namefunc = Fname.text ?? ""
        let Lnamefunc = Lname.text ?? ""
        let Mailfunc = Mail.text ?? ""
        let genderfunc = Gender.text ?? ""
        
        let registration = register(namelet:Namefunc, LNamelet: Lnamefunc, maillet: Mailfunc, genderlet: genderfunc)
            User.append(registration)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
        if identifier == "segue_to_second _page"{
            if let destination = segue.destination as? ProfileVC{
                destination.Prople = self.User }
            }}}

class register{
let namelet:String
let lNamelet:String
let maillet:String
let genderlet:String

init(namelet: String, LNamelet: String, maillet: String, genderlet: String){
    self.namelet = namelet
    self.lNamelet = LNamelet
    self.maillet = maillet
    self.genderlet = genderlet
    
        }
    }
}
