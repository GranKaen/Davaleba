//
//  ViewController.swift
//  Davaleba39
//
//  Created by konstantine gudushauri on 6/12/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alertbutton(_ sender: Any) {
        
        let alert = UIAlertController(title: "\n\n", message: "rame sakaifo teqsti", preferredStyle: .alert)
        
        let cover = UIAlertAction(title: "sakaifo teqstia", style: .cancel, handler: nil)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 80, height: 80))
        imageView.image = UIImage(named: "sakaifosurati")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(imageView)
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        alert.addAction(cover)

        alert.view.alpha = 0
        
        self.present(alert, animated: false) {
            alert.view.alpha = 1
            alert.view.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {() -> Void in
                alert.view.transform = .identity
            }, completion: {(finished: Bool) -> Void in
                alert.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {() -> Void in alert.view.transform = .identity}) { (finished) in
                                    }
            })
        }
        
    }
    
}

