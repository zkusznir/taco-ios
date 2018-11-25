//
//  AppMenuRouter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class AppMenuRouter {
    
    private weak var source: AppMenuViewController?
    
    init(source: AppMenuViewController) {
        self.source = source
    }
    
    func showLogin() {
        let nc = AppNavigationController()
        nc.viewControllers = [LoginViewController()]
        source?.splitViewController?.showDetailViewController(nc, sender: nil)
    }
    func showAccount() {
        let nc = AppNavigationController()
        nc.viewControllers = [AccountViewController()]
        source?.splitViewController?.showDetailViewController(nc, sender: nil)
    }
    func showTransactions() {
        let nc = AppNavigationController()
        nc.viewControllers = [TransactionsViewController()]
        source?.splitViewController?.showDetailViewController(nc, sender: nil)
    }
    func showFamily() {
        let nc = AppNavigationController()
        nc.viewControllers = [FamilyViewController()]
        source?.splitViewController?.showDetailViewController(nc, sender: nil)
    }
    
}
