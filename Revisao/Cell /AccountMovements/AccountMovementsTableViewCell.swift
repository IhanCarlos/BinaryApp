//
//  AccountMovementsTableViewCell.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class AccountMovementsTableViewCell: UITableViewCell {

    static let identifier = "AccountMovementsTableViewCell"
    
    lazy var accountDatail:AccountMovementsView = {
        let view = AccountMovementsView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(accountDatail)
        backgroundColor = .lightGray
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            //tableView
            self.accountDatail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.accountDatail.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.accountDatail.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.accountDatail.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }

}
