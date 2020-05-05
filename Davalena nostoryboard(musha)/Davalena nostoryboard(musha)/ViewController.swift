//
//  ViewController.swift
//  Davalena nostoryboard(musha)
//
//  Created by Kote Ghudushauri on 5/4/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var greenW: NSLayoutConstraint!
    var greenH: NSLayoutConstraint!
    var greenX: NSLayoutConstraint!
    var greenY: NSLayoutConstraint!
    var blueW: NSLayoutConstraint!
    var blueH: NSLayoutConstraint!
    var blueX: NSLayoutConstraint!
    var blueY: NSLayoutConstraint!
    var selected = 0
    let greenview = UIView()
    let blueview = UIView()
    let firstfield: UITextField = {
        let k = UITextField()
        k.translatesAutoresizingMaskIntoConstraints = false
        k.layer.borderColor = UIColor.black.cgColor
        k.layer.cornerRadius = 10
        k.layer.borderWidth = 1
        k.placeholder = "Width"
        
        return k
    }()
    let secondfield: UITextField = {
        let o = UITextField()
        
        o.translatesAutoresizingMaskIntoConstraints = false
        o.layer.borderColor = UIColor.black.cgColor
        o.layer.cornerRadius = 10
        o.layer.borderWidth = 1
        o.placeholder = "Height"
        return o
    }()
    let fieldbutton: UIButton = {
        
        let t = UIButton()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.setTitle("DO", for: .normal)
        t.addTarget(self , action: #selector(tutton), for: .touchUpInside)
        t.backgroundColor = .yellow
        t.layer.cornerRadius = 10
        return t
        
    }()
    let upbutton: UIButton = {
        let e = UIButton()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.setTitle("UP", for: .normal)
        e.addTarget(self , action: #selector(bup), for: .touchUpInside)
        e.backgroundColor = .orange
        e.layer.cornerRadius = 10
        return e
        
    }()
    let downbutton: UIButton = {
        let o2 = UIButton()
        o2.translatesAutoresizingMaskIntoConstraints = false
        o2.setTitle("Down", for: .normal)
        o2.addTarget(self , action: #selector(bdown), for: .touchUpInside)
        o2.backgroundColor = .orange
        o2.layer.cornerRadius = 10
        return o2
        
    }()
    let leftbutton: UIButton = {
        let o3 = UIButton()
        o3.translatesAutoresizingMaskIntoConstraints = false
        o3.setTitle("Left", for: .normal)
        o3.addTarget(self , action: #selector(bl), for: .touchUpInside)
        o3.backgroundColor = .orange
        o3.layer.cornerRadius = 10
        return o3
        
    }()
    let rightbutton: UIButton = {
        let o4 = UIButton()
        o4.translatesAutoresizingMaskIntoConstraints = false
        o4.setTitle("Right", for: .normal)
        o4.addTarget(self , action: #selector(br), for: .touchUpInside)
        o4.backgroundColor = .orange
        o4.layer.cornerRadius = 10
        return o4
        
    }()
    let slider: UISlider = {
        let s = UISlider()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.addTarget(self, action: #selector(slide), for: .valueChanged)
        s.minimumValue = 100
        s.maximumValue = 200
        s.value = 150
        return s
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(greenview)
        view.addSubview(blueview)
        view.addSubview(firstfield)
        view.addSubview(secondfield)
        view.addSubview(fieldbutton)
        view.addSubview(upbutton)
        view.addSubview(downbutton)
        view.addSubview(leftbutton)
        view.addSubview(rightbutton)
        view.addSubview(slider)
        blueview.backgroundColor = .systemIndigo
        greenview.backgroundColor = .systemGreen
        blueview.translatesAutoresizingMaskIntoConstraints = false
        greenview.translatesAutoresizingMaskIntoConstraints = false
        
        greenW = NSLayoutConstraint(item: greenview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        greenH = NSLayoutConstraint(item: greenview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        greenX = NSLayoutConstraint(item: greenview, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: -(self.view.frame.midX/2))
        greenY = NSLayoutConstraint(item: greenview, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20)
        self.view.addConstraint(greenW)
        self.view.addConstraint(greenH)
        self.view.addConstraint(greenX)
        self.view.addConstraint(greenY)
        
        blueW = NSLayoutConstraint(item: blueview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        blueH = NSLayoutConstraint(item: blueview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        blueX = NSLayoutConstraint(item: blueview, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: self.view.frame.midX/2)
        blueY = NSLayoutConstraint(item: blueview, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20)
        self.view.addConstraint(blueW)
        self.view.addConstraint(blueH)
        self.view.addConstraint(blueX)
        self.view.addConstraint(blueY)
        
        NSLayoutConstraint.activate([
        firstfield.topAnchor.constraint(equalTo: view.topAnchor ,constant: 250 ),
        firstfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        firstfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280),
        firstfield.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
        secondfield.topAnchor.constraint(equalTo: view.topAnchor ,constant: 250 ),
        secondfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 140),
        secondfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
        secondfield.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            fieldbutton.topAnchor.constraint(equalTo: view.topAnchor ,constant: 250 ),
            fieldbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            fieldbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fieldbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            upbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            upbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            upbutton.widthAnchor.constraint(equalToConstant: 50),
            upbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            downbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140),
            downbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            downbutton.widthAnchor.constraint(equalToConstant: 50),
            downbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            rightbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80 ),
            rightbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80 ),
            rightbutton.widthAnchor.constraint(equalToConstant: 50),
            rightbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            leftbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            leftbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            leftbutton.widthAnchor.constraint(equalToConstant: 50),
            leftbutton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            slider.heightAnchor.constraint(equalToConstant: 50)
        ])
        greenview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gview)))
        blueview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(bview)))
        
        
    }

    @objc func tutton () {
        switch selected {
        case 0:
            ale(title: "Error", message: "Please, Select view")
        
        case 1:
            if firstfield.text == "" || secondfield.text == ""{ale(title: "Error", message: "Please, Write constraints")}
            else if Int(firstfield.text!) == nil || Int(secondfield.text!) == nil{ale(title: "Error", message: "Please, Write numbers")}
            else{
                greenW.constant = CGFloat(Int(firstfield.text!)!)
                greenH.constant = CGFloat(Int(secondfield.text!)!)
            }
        case 2:
            if firstfield.text == "" || secondfield.text == ""{ale(title: "Error", message: "Please, Write constraints")}
            else if Int(firstfield.text!) == nil || Int(secondfield.text!) == nil{ale(title: "Error", message: "Please, Write numbers")}
            else{
                blueW.constant = CGFloat(Int(firstfield.text!)!)
                blueH.constant = CGFloat(Int(secondfield.text!)!)
                
            }
        default:
            print("")
            }
        }
    
    @objc func gview() {selected = 1}
    
    @objc func bview() {selected = 2}
    
    @objc func bup() {
        switch selected {
        case 0:
            ale(title: "Error", message: "Please, Select View")
        case 1:
            greenY.constant -= 1
        case 2:
            blueY.constant -= 1
        default:
            print("")
        }
    }
    
    @objc func bdown() {
        switch selected {
        case 0:
            ale(title: "Error", message: "Please, Select View")
        case 1:
            greenY.constant += 1
        case 2:
            blueY.constant += 1
        default:
            print("")
        }
        
    }
    
    @objc func br() {
        switch selected {
        case 0:
            ale(title: "Error", message: "Please, Select View")
        case 1:
            greenX.constant += 1
        case 2:
            blueX.constant += 1
        default:
            print("")
        }
        
    }
    
    @objc func bl() {
        switch selected {
        case 0:
            ale(title: "Error", message: "Please, Select View")
        case 1:
            greenX.constant -= 1
        case 2:
            blueX.constant -= 1
        default:
            print("")
        }
    }
    
    @objc func slide() {
        greenH.constant += CGFloat(slider.value - 150)
        greenW.constant += CGFloat(slider.value - 150)
        blueH.constant += CGFloat(slider.value - 150)
        blueW.constant += CGFloat(slider.value - 150)
    }
    
    func ale(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    

}

