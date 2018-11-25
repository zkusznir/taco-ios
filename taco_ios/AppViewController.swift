//
//  AppViewController.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
//        if self is AppMenuViewController {
//            self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "menu")
//            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "transactions")
//            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
//        } else {
//            self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "logout")
//            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "logout")
//            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
//        }
    }
}

extension AppViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return PushAnimator()
        case .pop:
            return PopAnimator()
        default:
            return nil
        }
    }
}
