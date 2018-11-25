//
//  FamilyPresenter.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

protocol FamilyViewProtocol: class {
    
}

final class FamilyPresenter {
    
    unowned var view: FamilyViewProtocol
    
    var model: FamilyModel?
    
    init(view: FamilyViewProtocol) {
        self.view = view
    }
    
    
    
}

