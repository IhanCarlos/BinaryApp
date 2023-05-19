//
//  CardsCollectionViewCell.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    
    static let identifier:String = "CardsCollectionViewCell"
    
    let cardsScreen:CardsView = CardsView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configConstraints()
    }

    public func setUpCell(data:cardDatail) {
        cardsScreen.imageState.image = UIImage(named: data.nameImage)
        cardsScreen.titleLabel.text = data.titleState
        cardsScreen.saldoLabel.text = data.saldoTitle
        cardsScreen.icon.image = UIImage(named: data.simbol)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        cardsScreen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardsScreen)
    }
    
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            cardsScreen.topAnchor.constraint(equalTo: topAnchor),
            cardsScreen.leftAnchor.constraint(equalTo: leftAnchor),
            cardsScreen.rightAnchor.constraint(equalTo: rightAnchor),
            cardsScreen.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}
