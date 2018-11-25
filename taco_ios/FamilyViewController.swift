//
//  FamilyViewController.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class FamilyViewController: HeaderViewController {
    
    lazy var presenter: FamilyPresenter = {
        return FamilyPresenter(view: self)
    }()
    lazy var router: FamilyRouter = {
        return FamilyRouter(source: self)
    }()
    
    private let tableViewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lista"
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.dark
        return view
    }()
    
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetch()
        
        titleLabel.text = "Grupy"
        iconImageView.image = #imageLiteral(resourceName: "account")
        upperLabel.text = "użytkownik"
        loverLabel.text = "Aleksander"
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(FamilyCell.self, forCellReuseIdentifier: String(describing: FamilyCell.self))
        setUpConstrains()
    }
}

extension FamilyViewController: FamilyViewProtocol {
    func refresh() {
        tableView.reloadData()
    }
}

extension FamilyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.groups.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyCell.self)) as! FamilyCell
        cell.upperLabel.text = presenter.groups[indexPath.row].name
        cell.loverLabel.text = "\(presenter.groups[indexPath.row].usersCount)"
        cell.rightLabel.text = ""
        return cell
    }
}

extension FamilyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppSounds.touchUpInside.play()
        let vc = FamilyDetailsViewController()
        vc.upperLabel.text = "nazwa grupy"
        vc.loverLabel.text = presenter.groups[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FamilyViewController {
    
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
        tableView.bottomAnchor.constraint(equalTo: bottomImageView.topAnchor).isActive = true
        
        bottomImageView.isHidden = false
    }
}
