//
//  profile.swift
//  Davaleba login+register+profile
//
//  Created by Kote Ghudushauri on 5/6/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class profile: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var maillable: UILabel!
    
    @IBOutlet weak var textview: UITextView!
    
    @IBOutlet weak var colorselection: UISegmentedControl!
    
    
    func saveme() {
        usernameLabel.text = "Username: \(UserDefaults.standard.string(forKey: "username") ?? "")"
        maillable.text = "Mail: \(UserDefaults.standard.string(forKey: "mail") ?? "")"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.saveme()
        SaveSystem.beginotclicked()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //textview.text = (UserDefaults.standard.string(forKey: "text"))
        let savedc = UserDefaults.standard.integer(forKey: "seg")
        let colo = color(savedc: savedc)
        chose(color: colo)
        colorselection.selectedSegmentIndex = savedc
    }
    @IBAction func onsegmenttapped(_ sender: UISegmentedControl) {
        let savedc = sender.selectedSegmentIndex
        let colo = color(savedc : savedc)
        chose(color: colo)
        UserDefaults.standard.set(savedc, forKey: "seg")
    }
    
    func chose(color: UIColor){
        self.view.backgroundColor = color
        textview.backgroundColor = color
    }
    func color(savedc: Int) -> UIColor {
        switch savedc {
        
        case 0:
        return .systemGray2
        case 1:
        return .systemGray
        default:
        return .white
        }
    }

}
