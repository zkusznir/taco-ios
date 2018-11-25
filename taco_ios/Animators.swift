//
//  Animators.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("animate")
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        transitionContext.containerView.addSubview(toViewController.view)
        
        let width = UIScreen.main.bounds.width
        fromViewController.view.alpha = 1
        fromViewController.view.frame.origin = CGPoint(x: 0, y: 0)
        toViewController.view.frame.origin = CGPoint(x: width, y: 0)
        toViewController.view.alpha = 0
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.frame.origin = CGPoint(x: -width, y: 0)
            toViewController.view.alpha = 1
            toViewController.view.frame.origin = CGPoint(x: 0, y: 0)
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

final class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("animate")
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        transitionContext.containerView.addSubview(toViewController.view)
        
        let width = UIScreen.main.bounds.width
        fromViewController.view.alpha = 1
        fromViewController.view.frame.origin = CGPoint(x: 0, y: 0)
        toViewController.view.frame.origin = CGPoint(x: -width, y: 0)
        toViewController.view.alpha = 0
        
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.frame.origin = CGPoint(x: width, y: 0)
            toViewController.view.alpha = 1
            toViewController.view.frame.origin = CGPoint(x: 0, y: 0)
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
