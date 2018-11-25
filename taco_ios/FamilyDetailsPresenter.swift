//
//  FamilyDetailsPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 25/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol FamilyDetailsViewProtocol: class {
    func refresh()
}

final class FamilyDetailsPresenter {
    
    weak var view: FamilyDetailsViewProtocol?
    
    private(set) var members: Members = [] {
        didSet {
            view?.refresh()
        }
    }
    
    func fetch() {
        RestAPI().fetchMembers(id: 1) { [weak self] in self?.members = $0 }
    }
    
    init(view: FamilyDetailsViewProtocol) {
        self.view = view
    }
}

