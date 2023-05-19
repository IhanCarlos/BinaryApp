//
//  HomeSreen.swift
//  BinaryApp
//
//  Created by ihan carlos on 29/04/23.
//

import UIKit

class HomeSreen: UIView {
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
        tableView.register(AccountMovementsTableViewCell.self, forCellReuseIdentifier: AccountMovementsTableViewCell.identifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.setUpContraints()
    }
    
    public func configTableViewProtocols(delegate:UITableViewDelegate,dataSource:UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    func addSubview() {
        self.addSubview(tableView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            //tableView
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
}

