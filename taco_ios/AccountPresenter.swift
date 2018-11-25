//
//  AccountPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol AccountViewProtocol: class {
    func refresh()
}

final class AccountPresenter {
    
    weak var view: AccountViewProtocol?
    
    init(view: AccountViewProtocol) {
        self.view = view
    }
    
    private(set) var accounts: [Account] = [] {
        didSet {
            view?.refresh()
        }
    }
    
    func fetch() {
        RestAPI().fetchAccounts(id: 1) { [weak self] in self?.accounts = $0 }
    }
    
}

