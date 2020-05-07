//
//  tabbar.swift
//  Davaleba Whatsapp
//
//  Created by Kote Ghudushauri on 5/7/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.selectedIndex = 2
    }
    

    

}
extension tabbar: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("")
    }
    private func tabbarcontroller(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        print(fromVC)
        
        return nil
    }
}

