//
//  ViewController.swift
//  Davaleba50
//
//  Created by konstantine gudushauri on 6/29/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var changeView: UIView!
    @IBOutlet weak var cRad: UISlider!
    @IBOutlet weak var size: UISlider!
    @IBOutlet weak var rotation: UISlider!
    var x: Int = 1
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        cRad.maximumValue = Float(changeView.frame.height)/2
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func animateCR(with radius: CGFloat, duration: TimeInterval = 1){
        UIView.animate(withDuration: duration) {
            self.changeView.layer.cornerRadius = radius
        }
    }
    
    func animateSize(with scale: CGFloat, duration: TimeInterval = 1){
        UIView.animate(withDuration: duration) {
            self.changeView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func animateRot(with angle: CGFloat, duration: TimeInterval = 1){
        UIView.animate(withDuration: duration) {
            self.changeView.transform = CGAffineTransform(rotationAngle: .pi/180 * angle)
        }
    }
    
    
    
    
    @IBAction func crslider(_ sender: UISlider) {
        animateCR(with: CGFloat(sender.value))
    }
    @IBAction func sizeslider(_ sender: UISlider) {
        animateSize(with: CGFloat(sender.value))
        
    }
    @IBAction func rotSlider(_ sender: UISlider) {
        animateRot(with: CGFloat(sender.value))
        
    }
   
    @IBAction func onCollor(_ sender: UIButton) {
        
        switch x {
        case 1:
            changeView.backgroundColor = .purple
        case 2:
            changeView.backgroundColor = .orange
        case 3:
            changeView.backgroundColor = .systemRed
        case 4:
            changeView.backgroundColor = .yellow
        case 5:
            changeView.backgroundColor = .green
        default:
            x -= 5
        }
        
        
        x += 1
        
    }
    

}

