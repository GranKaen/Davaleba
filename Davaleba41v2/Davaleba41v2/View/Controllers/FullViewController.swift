//
//  FullViewController.swift
//  Davaleba41v2
//
//  Created by konstantine gudushauri on 6/16/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class FullViewController: UIViewController {
    @IBOutlet weak var coffeimageon: UIImageView!
    
    @IBOutlet weak var backimage: UIImageView!
    @IBOutlet weak var coffenameon: UILabel!
    var tempName: String? {
                didSet {
                    DispatchQueue.main.async {
                        self.coffenameon.text = self.tempName
                    }
            }
        }
        
        var tempImage: String? {
            didSet {
                DispatchQueue.main.async {
                    self.coffeimageon.image = UIImage(named: self.tempImage!)
                }
            }
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            backimage.isUserInteractionEnabled = true
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goBack))
            
            backimage.addGestureRecognizer(tapGesture)

        }
        
        @objc func goBack() {
            navigationController?.popViewController(animated: true)
        }

    }
