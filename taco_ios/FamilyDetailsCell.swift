//
//  FamilyDetailsCell.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 25/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class FamilyDetailsCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        
        self.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        
        UIDevice.current.model == "iPad" ? setUpIPadConstraints() : setUpIPhoneConstraints()
    }
    
    private func setUpIPhoneConstraints() {
        titleLabel.text = "iPhone"
    }
    
    private func setUpIPadConstraints() {
        titleLabel.text = "iPad"
    }
}
