//
//  TransactionsPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol TransactionsViewProtocol: class {
    
}

final class TransactionsPresenter {
    
    unowned var view: TransactionsViewProtocol
    
    var model: TransactionsModel?
    
    init(view: TransactionsViewProtocol) {
        self.view = view
    }
    
    
    
}

