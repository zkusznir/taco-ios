//
//  BaseCell.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 25/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    private let shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 1.0
        view.layer.shadowOffset = CGSize.zero
        view.backgroundColor = UIColor(white: 0.99, alpha: 0.99)
        return view
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "star.png")
        return imageView
    }()
    
    let upperLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.text = "text"
        return label
    }()
    
    let loverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "text"
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "text"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        self.addSubview(shadowView)
        self.addSubview(iconImageView)
        self.addSubview(upperLabel)
        self.addSubview(loverLabel)
        self.addSubview(rightLabel)
        
        shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        shadowView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shadowView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor).isActive = true
        
        upperLabel.leadingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 16).isActive = true
        upperLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        loverLabel.leadingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 16).isActive = true
        loverLabel.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 8).isActive = true
        
        rightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        rightLabel.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor).isActive = true
    }
}
