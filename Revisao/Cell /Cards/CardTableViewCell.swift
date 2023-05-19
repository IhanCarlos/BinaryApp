//
//  CardTableViewCell.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    static let identifier = "CardTableViewCell"
    
    lazy var cardDatail:CardView = {
        let view = CardView()
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cardDatail)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            //tableView
            self.cardDatail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.cardDatail.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.cardDatail.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.cardDatail.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
}
