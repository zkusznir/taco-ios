//
//  AccountViewController.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class AccountViewController: HeaderViewController {
    
    lazy var presenter: AccountPresenter = {
        return AccountPresenter(view: self)
    }()
    lazy var router: AccountRouter = {
        return AccountRouter(source: self)
    }()
    
    private let tableViewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lista rachunków"
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.dark
        return view
    }()
    
    private let tableView = UITableView()
    
    @objc private func safgsdf() {
        let vc = FamilyViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetch()
        
        titleLabel.text = "Konto"
        iconImageView.image = #imageLiteral(resourceName: "bank")
        upperLabel.text = "dostępne środki"
        loverLabel.text = "13'528,55 PLN"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(AccountCell.self, forCellReuseIdentifier: String(describing: AccountCell.self))
        setUpConstrains()
    }
}

extension AccountViewController: AccountViewProtocol {
    func refresh() {
        tableView.reloadData()
    }
}

extension AccountViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.accounts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AccountCell.self)) as! AccountCell
        cell.upperLabel.text = presenter.accounts[indexPath.row].type
        cell.loverLabel.text = presenter.accounts[indexPath.row].number
//        cell.rightLabel.text = presenter.accounts[indexPath.row].description
        return cell
    }
}

extension AccountViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppSounds.touchUpInside.play()
    }
}

extension AccountViewController {
    
    private func setUpConstrains() {
        // preparing views
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // adding views
        view.addSubview(tableViewTitleLabel)
        view.addSubview(lineView)
        view.addSubview(tableView)
        
        // adding constraints
        tableViewTitleLabel.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 8).isActive = true
        tableViewTitleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        tableViewTitleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableViewTitleLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        lineView.topAnchor.constraint(equalTo: tableViewTitleLabel.bottomAnchor, constant: 8).isActive = true
        lineView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        lineView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        tableView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 4).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
}
