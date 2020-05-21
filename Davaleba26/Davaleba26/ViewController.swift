//
//  ViewController.swift
//  Davaleba26
//
//  Created by Kote Ghudushauri on 5/21/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
let tomnotificationkey = "Tom.Chosen"
let phishnotificationkey = "Phish.Chosen"

class ViewController: UIViewController {
    let tompic = Notification.Name(rawValue: tomnotificationkey)
    let phishpic = Notification.Name(rawValue: phishnotificationkey)

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBOutlet weak var memetext: UILabel!
    @IBOutlet weak var memeimg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createObservers()
    }


    func createObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updatememeimage(notification:)), name: tompic, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: tompic, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updatememeimage(notification:)), name: phishpic, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateLabel(notification:)), name: phishpic, object: nil)
    }
    
    @objc func updatememeimage(notification: NSNotification) {
        let istom = notification.name == tompic
        let image = istom ? UIImage(named: "Tom")! : UIImage(named: "Phish")!
        memeimg.image = image
    }
    
    @objc func updateLabel(notification: NSNotification) {
        let istom = notification.name == tompic
        let text = istom ? "ლექტორმა ქულა დამაკლო.\n   \n მე:" : "ლექტორმა 50 ქულა დამიწერა. \n  \n მე:"
        memetext.text = text
    }
    
    
}

