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
    
    let bottomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "bottomBackground.png")
        return imageView
    }()
    
    private let upLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "oferta rodzinna"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = AppColors.dark
        return label
    }()
    
    private let minLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wybrana specjalnie \ndla CIEBIE"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = AppColors.dark
        return label
    }()
    private let botLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PRSO 6%\nOprocentowanie zmienne 0%"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(backImageView)
        backImageView.addSubview(iconImageView)
        backImageView.addSubview(upperLabel)
        backImageView.addSubview(loverLabel)
        view.addSubview(bottomImageView)
        
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
        
        bottomImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        bottomImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        bottomImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        bottomImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        bottomImageView.isHidden = true
        
        bottomImageView.addSubview(upLabel)
        bottomImageView.addSubview(minLabel)
        bottomImageView.addSubview(botLabel)
        
        upLabel.topAnchor.constraint(equalTo: bottomImageView.topAnchor, constant: 8).isActive = true
        upLabel.leadingAnchor.constraint(equalTo: bottomImageView.leadingAnchor, constant: 16).isActive = true
        
        
        minLabel.topAnchor.constraint(equalTo: bottomImageView.topAnchor, constant: 30).isActive = true
        minLabel.leadingAnchor.constraint(equalTo: bottomImageView.leadingAnchor, constant: 16).isActive = true
        
        
        botLabel.topAnchor.constraint(equalTo: bottomImageView.topAnchor, constant: 82).isActive = true
        botLabel.leadingAnchor.constraint(equalTo: bottomImageView.leadingAnchor, constant: 16).isActive = true
        
    }
}
