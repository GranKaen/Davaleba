//
//  ViewController.swift
//  Davaleba41v2
//
//  Created by konstantine gudushauri on 6/15/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
   
var homeViewController :UIViewController!
    var cupViewController  :UIViewController!
    var profileViewController  :UIViewController!
    
    var viewControllers: [UIViewController]!
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "cup_id")
        cupViewController = storyboard.instantiateViewController(withIdentifier: "home_id")
        profileViewController = storyboard.instantiateViewController(withIdentifier: "profile_id")
        
        viewControllers = [cupViewController,homeViewController,profileViewController]
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])

    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        
        addChild(vc)
        vc.view.frame = mainView.bounds
        mainView.addSubview(vc.view)

        vc.didMove(toParent: self)
    }
}


