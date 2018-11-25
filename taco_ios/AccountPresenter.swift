//
//  AccountPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol AccountViewProtocol: class {
    
}

final class AccountPresenter {
    
    unowned var view: AccountViewProtocol
    
    var model: AccountModel?
    
    init(view: AccountViewProtocol) {
        self.view = view
    }
    
    
    
}

