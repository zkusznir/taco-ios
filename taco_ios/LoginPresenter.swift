//
//  LoginPresenter.swift
//  zzz
//
//  Created by Przemyslaw Biskup on 19/02/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    
}

final class LoginPresenter {
    
    unowned var view: LoginViewProtocol
    
    init(view: LoginViewController) {
        self.view = view
    }
    
    
    
}

