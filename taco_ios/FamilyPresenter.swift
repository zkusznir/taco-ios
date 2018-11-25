//
//  FamilyPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol FamilyViewProtocol: class {
    func refresh()
}

final class FamilyPresenter {
    
    weak var view: FamilyViewProtocol?
    
    private(set) var groups: Groups = [] {
        didSet {
            view?.refresh()
        }
    }
    
    func fetch() {
        RestAPI().fetchGroups(id: 1) { [weak self] in self?.groups = $0 }
    }
    
    init(view: FamilyViewProtocol) {
        self.view = view
    }
    
    
    
}

