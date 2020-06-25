//
//  SecondViewController.swift
//  Davaleba47
//
//  Created by konstantine gudushauri on 6/24/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            transitioningDelegate = self
            setupImageView()
            
        }
        
        private func setupImageView(){
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
            
            backgroundImageView.addGestureRecognizer(tapGesture)
            
            
        }
        
        @objc func onTap(){
            dismiss(animated: true, completion: nil)
            
        }
    }

    extension SecondViewController: UIViewControllerTransitioningDelegate{
        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            AnimationController(duration: 1, type: .present)
            
        }
        
        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return AnimationController(duration: 1, type: .dismiss)
        }
    

}
