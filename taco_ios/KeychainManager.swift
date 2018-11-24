//
//  KeychainManager.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

struct KeychainManager {
    
    private let defaults = UserDefaults.standard
    
    var isOnboardingCompleted: Bool {
        get {
            return defaults.value(forKey: "isOnboardingCompleted") as? Bool ?? false
        }
        set {
            defaults.set(newValue, forKey: "isOnboardingCompleted")
        }
    }
}
