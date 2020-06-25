//
//  Animation.swift
//  Davaleba47
//
//  Created by konstantine gudushauri on 6/25/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class AnimationController: NSObject{
    private let animationDuration: Double
    private let animationType: AnimationType
    
    enum AnimationType{
        case present
        case dismiss
    }
    
    init(duration: Double, type: AnimationType){
        self.animationDuration = duration
        self.animationType = type
    }
}

extension AnimationController: UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.viewController(forKey: .to),
            let fromView = transitionContext.viewController(forKey: .from)
            else {
                transitionContext.completeTransition(false)
                return
        }
        
        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toView.view)
            presentAnimation(with: transitionContext, viewToAnimate: toView.view)
        case .dismiss:
            transitionContext.containerView.addSubview(toView.view)
            transitionContext.containerView.addSubview(fromView.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromView.view)
        }
        
    }
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        viewToAnimate.clipsToBounds = true
        let frame = viewToAnimate.frame
        
        viewToAnimate.frame = .init(x: frame.width, y: 0, width: frame.width, height: frame.height)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            viewToAnimate.frame = .init(x: 0, y: 0, width: frame.width, height: frame.height)
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
        viewToAnimate.clipsToBounds = true
        let frame = viewToAnimate.frame
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            viewToAnimate.transform = CGAffineTransform(translationX: -frame.width, y: -frame.height)
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    
    
}
