//
//  ViewController.swift
//  Davaleba37
//
//  Created by konstantine gudushauri on 6/9/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var roundview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlag()
        // Do any additional setup after loading the view.
    }

    func setupFlag() {
        let width = roundview.frame.width
        let height = roundview.frame.height
        let bcolor = UIColor(red: 59/255, green: 167/255, blue: 152/255, alpha: 1)
        let bvolor2 = UIColor(red: 127/255, green: 127/255, blue: 127/255, alpha: 1)
        let bcolor3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let second = CALayer()
        second.backgroundColor = bcolor.cgColor
        second.frame = CGRect(x: width/9, y: height/9, width: width / 1.25, height: height / 1.25)
        second.cornerRadius = second.frame.height / 2
        let third = CALayer()
        third.backgroundColor = bvolor2.cgColor
        third.frame = CGRect(x: width/5.7, y: height/5.7, width: width / 1.5, height: height / 1.5)
        third.cornerRadius = third.frame.height / 2
        let white = CALayer()
        white.backgroundColor = bcolor3.cgColor
        white.frame = CGRect(x: width/5.1, y: height/5.1, width: width / 1.6, height: height / 1.6)
        white.cornerRadius = white.frame.height / 2
        
        roundview.layer.addSublayer(second)
        roundview.layer.addSublayer(third)
        roundview.layer.addSublayer(white)
    }
}

