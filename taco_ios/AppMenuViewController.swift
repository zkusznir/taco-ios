//
//  AppMenuViewController.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class AppMenuViewController: AppViewController {
    
    lazy var presenter: AppMenuPresenter = {
        return AppMenuPresenter(view: self)
    }()
    lazy var router: AppMenuRouter = {
        return AppMenuRouter(source: self)
    }()
    
    private let tableView = UITableView()
    
    private let backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "menuBackground.png")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        User.view = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(AppMenuCell.self, forCellReuseIdentifier: String(describing: AppMenuCell.self))
        tableView.separatorStyle = .none
        setUpConstrains()
    }
}

extension AppMenuViewController: AppMenuViewProtocol {
    func refreshMenuData() {
        tableView.reloadData()
    }
}

extension AppMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.currentMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AppMenuCell.self)) as! AppMenuCell
        cell.titleLabel.text = presenter.currentMenu[indexPath.row].string
        cell.iconImageView.image = presenter.currentMenu[indexPath.row].icon
        return cell
    }
}

extension AppMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppSounds.touchUpInside.play()
        switch presenter.currentMenu[indexPath.row] {
        case .logIn:
            router.showLogin()
        case .account:
            router.showAccount()
        case .transactions:
            router.showTransactions()
        case .family:
            router.showFamily()
        case .logOut:
            break
        }
    }
}

extension AppMenuViewController {
    
    private func setUpConstrains() {
        // preparing views
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // adding views
        view.addSubview(backImageView)
        view.addSubview(tableView)
        
        // adding constraints
        
        backImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
