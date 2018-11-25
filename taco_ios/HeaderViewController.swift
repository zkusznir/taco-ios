//
//  HeaderViewController.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 25/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

class HeaderViewController: AppViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.dark
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "headerBackground.png")
        return imageView
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "star.png")
        return imageView
    }()
    
    let upperLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let loverLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(backImageView)
        backImageView.addSubview(iconImageView)
        backImageView.addSubview(upperLabel)
        backImageView.addSubview(loverLabel)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        backImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        backImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        backImageView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        
        iconImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 16).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: backImageView.centerYAnchor).isActive = true
        
        upperLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        upperLabel.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 8).isActive = true
        
        loverLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16).isActive = true
        loverLabel.topAnchor.constraint(equalTo: upperLabel.bottomAnchor, constant: 8).isActive = true
    }
}
