//
//  ViewController.swift
//  PaintingSquare
//
//  Created by konstantine gudushauri on 6/3/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSquare()
        // Do any additional setup after loading the view.
    }

    func drawSquare(){
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 350, height: 250))
        let image = renderer.image { (ctx) in
            let square = CGRect(x: 15, y: 15, width: 300, height: 200)
            
            ctx.cgContext.setFillColor(UIColor.systemYellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.systemTeal.cgColor)
            ctx.cgContext.setLineWidth(30)
            
            ctx.cgContext.addRect(square)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        imageView.image = image
    }
    
    
    
}

