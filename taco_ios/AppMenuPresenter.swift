//
//  AppMenuPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol AppMenuViewProtocol: class {
    func refreshMenuData()
}

final class AppMenuPresenter {
    
    weak var view: AppMenuViewProtocol?
    
    init(view: AppMenuViewProtocol) {
        self.view = view
    }
    
    var currentMenu: [MenuPosition] {
//        guard User.current != nil else { return [.logIn] }
        return [.account, .transactions, .family, .logOut]
    }
    
    
}

enum MenuPosition: Int, CaseIterable {
    case logIn
    case account
    case transactions
    case family
    case logOut
    
    
    var string: String {
        switch self {
        case .logIn:
            return "zaloguj"
        case .account:
            return "konto"
        case .transactions:
            return "transakcje"
        case .family:
            return "rodzina"
        case .logOut:
            return "wyloguj"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .logIn:
            return #imageLiteral(resourceName: "logout.png")
        case .account:
            return #imageLiteral(resourceName: "account.png")
        case .transactions:
            return #imageLiteral(resourceName: "transactions.png")
        case .family:
            return #imageLiteral(resourceName: "family.png")
        case .logOut:
            return #imageLiteral(resourceName: "logout.png")
        }
    }
}
