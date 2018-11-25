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
    
    private var lineConstraint: NSLayoutConstraint?
    
    private let tableMenuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8.0
        return stackView
    }()
    
    private let personsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("osoby", for: .normal)
        button.setTitleColor(AppColors.dark, for: .normal)
        button.addTarget(self, action: #selector(selectC(_:)), for: .touchUpInside)
        return button
    }()
    
    private let targetsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("cele", for: .normal)
        button.setTitleColor(AppColors.dark, for: .normal)
        button.addTarget(self, action: #selector(selectC(_:)), for: .touchUpInside)
        return button
    }()
    
    private let activitiesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("aktywności", for: .normal)
        button.setTitleColor(AppColors.dark, for: .normal)
        button.addTarget(self, action: #selector(selectC(_:)), for: .touchUpInside)
        return button
    }()
    
    private let budgetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("budżet", for: .normal)
        button.setTitleColor(AppColors.dark, for: .normal)
        button.addTarget(self, action: #selector(selectC(_:)), for: .touchUpInside)
        return button
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.dark
        return view
    }()
    
    private let selectLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColors.dark
        return view
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
    
    @objc private func selectC(_ sender: UIButton) {
        let x = sender.frame.origin.x + sender.frame.width/2
        lineConstraint?.constant = x
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.view.layoutIfNeeded()
        }
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
        view.addSubview(tableMenuStackView)
        tableMenuStackView.addArrangedSubview(personsButton)
        tableMenuStackView.addArrangedSubview(targetsButton)
        tableMenuStackView.addArrangedSubview(activitiesButton)
        tableMenuStackView.addArrangedSubview(budgetButton)
        
        personsButton.widthAnchor.constraint(equalTo: targetsButton.widthAnchor).isActive = true
        personsButton.widthAnchor.constraint(equalTo: budgetButton.widthAnchor).isActive = true
        
        view.addSubview(selectLineView)
        view.addSubview(lineView)
        view.addSubview(tableView)
        
        // adding constraints
        tableMenuStackView.topAnchor.constraint(equalTo: backImageView.bottomAnchor, constant: 8).isActive = true
        tableMenuStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 6).isActive = true
        tableMenuStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -6).isActive = true
        tableMenuStackView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        selectLineView.topAnchor.constraint(equalTo: tableMenuStackView.bottomAnchor, constant: 8).isActive = true
        selectLineView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        selectLineView.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        lineConstraint = selectLineView.centerXAnchor.constraint(equalTo: tableMenuStackView.leadingAnchor)
        lineConstraint?.constant = personsButton.frame.origin.x + personsButton.frame.width/2
        lineConstraint?.isActive = true
        
        lineView.topAnchor.constraint(equalTo: tableMenuStackView.bottomAnchor, constant: 8).isActive = true
        lineView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        lineView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        tableView.topAnchor.constraint(equalTo: selectLineView.bottomAnchor, constant: 4).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
