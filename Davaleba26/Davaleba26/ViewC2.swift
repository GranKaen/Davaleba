//
//  ViewC2.swift
//  Davaleba26
//
//  Created by Kote Ghudushauri on 5/21/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func FirstButton(_ sender: UIButton) {
        
        let name = Notification.Name(rawValue: tomnotificationkey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func SecondButton(_ sender: UIButton) {
        
        let name = Notification.Name(rawValue: phishnotificationkey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    

}
