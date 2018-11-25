//
//  TransactionsPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol TransactionsViewProtocol: class {
    func refresh()
}

final class TransactionsPresenter {
    
    weak var view: TransactionsViewProtocol?
    
    init(view: TransactionsViewProtocol) {
        self.view = view
    }
    
    private(set) var transactions: [Account] = [] {
        didSet {
            view?.refresh()
        }
    }
    
    func fetch() {
        
    }
    
}

