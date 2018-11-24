//
//  User.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

final class User {
    
    private init() {}
    
    static var view: AppMenuViewProtocol?
    
    static var current: User? {
        didSet {
            view?.refreshMenuData()
        }
    }
    
    static func setUser() {
        current = current == nil ? User() : nil
    }
    
}
