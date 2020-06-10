//
//  ViewController.swift
//  Davaleba38
//
//  Created by konstantine gudushauri on 6/10/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.

import UIKit

class Canvas: UIView {
    

    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        context.setStrokeColor(#colorLiteral(red: 0.248820128, green: 1, blue: 0.7957474799, alpha: 1).cgColor)
        context.setLineWidth(10)
        
        lines.forEach { (line) in
            for (index, point) in line.enumerated() {
                if index == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
        }
        
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: nil)
        
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(location)
        
        lines.append(lastLine)
        
        setNeedsDisplay()
    }
    
    
}

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    let canvas = Canvas()
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(canvas)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.frame = self.view.bounds
        canvas.backgroundColor = .white
        
        
    }
    
   


}

