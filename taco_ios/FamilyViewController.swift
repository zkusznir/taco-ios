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
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Rodzina"
        iconImageView.image = #imageLiteral(resourceName: "account")
        upperLabel.text = "nazwa grupy"
        loverLabel.text = "Tacosy"
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(FamilyCell.self, forCellReuseIdentifier: String(describing: FamilyCell.self))
        setUpConstrains()
    }
}

extension FamilyViewController: FamilyViewProtocol {
    
}

extension FamilyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 22
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FamilyCell.self)) as! FamilyCell
        return cell
    }
}

extension FamilyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppSounds.touchUpInside.play()
    }
}

extension FamilyViewController {
    
    private func setUpConstrains() {
        // preparing views
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // adding views
        view.addSubview(tableView)
        
        // adding constraints
        tableView.topAnchor.constraint(equalTo: backImageView.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
