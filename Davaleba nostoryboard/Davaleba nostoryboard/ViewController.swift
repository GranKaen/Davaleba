//
//  ViewController.swift
//  Davaleba nostoryboard
//
//  Created by Kote Ghudushauri on 5/4/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let greenView = UIView()
var greenH = 150
var greenW = 150
var greenX = 10
var greenY = 0
let blueView = UIView()
var blueH = 150
var blueW = 150
var blueX = -10
var blueY = 0
let Button = UIButton()
let ButtonUP = UIButton()
let ButtonDOWN = UIButton()
let ButtonR = UIButton()
let ButtonL = UIButton()
let FieldA = UITextField()
let FieldB = UITextField()
let Slide = UISlider()
var selected: Bool = false
    
    
    override func loadView() {
        super.loadView()
        
        
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(greenviewa)))
        
        view.addSubview(greenView)
        
        
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(blueviewa)))
        
        view.addSubview(blueView)
        
        
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Change", for: .normal)
        Button.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        Button.backgroundColor = .black
        
        view.addSubview(Button)
        
        
        ButtonUP.translatesAutoresizingMaskIntoConstraints = false
        ButtonUP.setTitle("U", for: .normal)
        ButtonUP.addTarget(self, action: #selector(onButtonUP), for: .touchUpInside)
        ButtonUP.backgroundColor = .black
        
        view.addSubview(ButtonUP)
        
        
        ButtonDOWN.translatesAutoresizingMaskIntoConstraints = false
        ButtonDOWN.setTitle("D", for: .normal)
        ButtonDOWN.addTarget(self, action: #selector(onButtonDOWN), for: .touchUpInside)
        ButtonDOWN.backgroundColor = .black
        
        view.addSubview(ButtonDOWN)
        
        
        ButtonR.translatesAutoresizingMaskIntoConstraints = false
        ButtonR.setTitle("R", for: .normal)
        ButtonR.addTarget(self, action: #selector(onButtonR), for: .touchUpInside)
        ButtonR.backgroundColor = .black
        
        view.addSubview(ButtonR)
        
        
        ButtonL.translatesAutoresizingMaskIntoConstraints = false
        ButtonL.setTitle("L", for: .normal)
        ButtonL.addTarget(self, action: #selector(onButtonL), for: .touchUpInside)
        ButtonL.backgroundColor = .gray
        
        view.addSubview(ButtonL)
        
        
        FieldA.translatesAutoresizingMaskIntoConstraints = false
        FieldA.backgroundColor = .red
        
        view.addSubview(FieldA)
        
        
        FieldB.translatesAutoresizingMaskIntoConstraints = false
        FieldB.backgroundColor = .red
        
        view.addSubview(FieldB)
        
        Slide.translatesAutoresizingMaskIntoConstraints = false
        Slide.backgroundColor = .green
        
        view.addSubview(Slide)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        greenView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(greenY)).isActive = true
        greenView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat(greenX)).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: CGFloat(greenH)).isActive = true
        greenView.widthAnchor.constraint (equalToConstant: CGFloat(greenW)).isActive = true
        
        
        
        blueView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(blueY)).isActive = true
        blueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: CGFloat(blueX)).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: CGFloat(blueH)).isActive = true
        blueView.widthAnchor.constraint (equalToConstant: CGFloat(blueW)).isActive = true
        
        
        
        
        Button.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 50).isActive = true
        Button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40).isActive = true
        Button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        Button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        FieldA.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        FieldA.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 50).isActive = true
        FieldA.heightAnchor.constraint(equalToConstant: 30).isActive = true
        FieldA.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        FieldB.leadingAnchor.constraint(equalTo: FieldA.trailingAnchor, constant: 20).isActive = true
        FieldB.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 50).isActive = true
        FieldB.heightAnchor.constraint(equalToConstant: 30).isActive = true
        FieldB.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        ButtonUP.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        ButtonUP.topAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        ButtonUP.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ButtonUP.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        ButtonDOWN.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        ButtonDOWN.topAnchor.constraint(equalTo: ButtonUP.bottomAnchor, constant: 100).isActive = true
        ButtonDOWN.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ButtonDOWN.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        ButtonL.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -70).isActive = true
        ButtonL.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60).isActive = true
        ButtonL.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ButtonL.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        ButtonR.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 70).isActive = true
        ButtonR.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60).isActive = true
        ButtonR.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ButtonR.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        Slide.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100).isActive = true
        Slide.topAnchor.constraint(equalTo: ButtonDOWN.bottomAnchor, constant: 50).isActive = true
        Slide.heightAnchor.constraint(equalToConstant: 30).isActive = true
        Slide.widthAnchor.constraint(equalToConstant: 200).isActive = true
                    }

    @objc func onButton(){
        let x = FieldA.text ?? "0"
        let y = FieldB.text ?? "0"
        let k = Int(x)
        let o = Int(y)
        if selected == true{blueX = k ?? 150}
        if selected == false{blueY = o ?? 150}
    }
    @objc func onButtonUP(){
        if selected == true{
            blueY += 1
        }
        else if selected == false{
           greenY += 1
        }
        
    }
    @objc func onButtonDOWN(){
        if selected == true{
           blueY -= 1
        }
        else if selected == false{
            greenY -= 1
        }
    }
    @objc func onButtonR(){
        if selected == true{
         blueX -= 1
        }
        else if selected == false{
            greenX -= 1
        }
        
    }
    @objc func onButtonL(){
        if selected == true{
            blueX += 1
        }
        else if selected == false{
            blueX += 1
        }
        
    }
    @objc func greenviewa(){
        selected = true
    }
    @objc func blueviewa(){
        selected = false
    }
}
    



