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
        guard User.current != nil else { return [.login] }
        return [.cos]
    }
    
    
}

enum MenuPosition: Int, CaseIterable {
    case login
    case cos
    
    
    var string: String {
        switch self {
        case .login:
            return "Log in"
        case .cos:
            return "cos"
        }
    }
}
