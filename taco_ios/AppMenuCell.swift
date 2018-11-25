//
//  AppMenuCell.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class AppMenuCell: UITableViewCell {
    
    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8.0
        return stackView
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.selectionStyle = .none
        
        self.backgroundColor = .clear
        
        self.addSubview(cellStackView)
        
        cellStackView.addArrangedSubview(iconImageView)
        cellStackView.addArrangedSubview(titleLabel)
        
        cellStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        cellStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        cellStackView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        iconImageView.widthAnchor.constraint(equalToConstant: 67).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

