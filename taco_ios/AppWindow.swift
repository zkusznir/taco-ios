//
//  AppWindow.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit
import CoreMotion
import SceneKit

final class AppWindow: UIWindow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tintColor = AppColors.dark
        self.backgroundColor = .white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
