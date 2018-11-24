//
//  AppStrings.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import Foundation

extension String {
    /// NSLS -> NSLocalizedString
    ///
    /// - Returns: NSLocalizedString(self, comment: "")
    var NSLS: String {
        return NSLocalizedString(self, comment: "")
    }
}
