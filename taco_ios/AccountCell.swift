//
//  AccountCell.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class AccountCell: BaseCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        
        self.backgroundColor = .clear
        
        
        UIDevice.current.model == "iPad" ? setUpIPadConstraints() : setUpIPhoneConstraints()
    }
    
    private func setUpIPhoneConstraints() {
        
    }
    
    private func setUpIPadConstraints() {
        
    }
}
