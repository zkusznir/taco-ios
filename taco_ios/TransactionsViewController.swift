//
//  TransactionsViewController.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import UIKit

final class TransactionsViewController: HeaderViewController {
    
    lazy var presenter: TransactionsPresenter = {
        return TransactionsPresenter(view: self)
    }()
    lazy var router: TransactionsRouter = {
        return TransactionsRouter(source: self)
    }()
    
    private let tableViewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lista transakcji"
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
        
        titleLabel.text = "Transakcje"
        iconImageView.image = #imageLiteral(resourceName: "bank")
        upperLabel.text = "dostępne środki"
        loverLabel.text = "13'528,55 PLN"
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(TransactionsCell.self, forCellReuseIdentifier: String(describing: TransactionsCell.self))
        setUpConstrains()
    }
}

extension TransactionsViewController: TransactionsViewProtocol {
    func refresh() {
        tableView.reloadData()
    }
}

extension TransactionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionsCell.self)) as! TransactionsCell
        cell.upperLabel.text = "płatność kartą"
        cell.loverLabel.text = "20:52 16.08.2018"
        cell.rightLabel.text = "425,23 PLN"
        return cell
    }
}

extension TransactionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppSounds.touchUpInside.play()
    }
}

extension TransactionsViewController {
    
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
