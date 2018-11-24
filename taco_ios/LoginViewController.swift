//
//  LoginViewController.swift
//  zzz
//
//  Created by Przemyslaw Biskup on 19/02/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class LoginViewController: AppViewController {
    
    lazy var presenter: LoginPresenter = {
        return LoginPresenter(view: self)
    }()
    lazy var router: LoginRouter = {
        return LoginRouter(source: self)
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Zaloguj się", for: .normal)
        button.setTitleColor(AppColors.buttonText, for: .normal)
        button.backgroundColor = AppColors.buttonBackground
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configInit()
        assignConstraints()
    }
    
    private func configInit() {
        loginButton.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
    }
    
    private func assignConstraints() {
        view.addSubview(loginButton)
        
        loginButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
    
    @objc private func logInAction() {
        User.setUser()
    }
}

extension LoginViewController: LoginViewProtocol {
    
}
