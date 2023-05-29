//
//  CardTableViewCell.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    var cardScreen:CardView = CardView()
    var data:[cardDatail] = []
    
    static let identifier = "CardTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cardScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(cardScreen)
        cardScreen.configProtocolsCollectionView(delegate: self, dataSource: self)
        setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        func setUpViews() {
            self.cardScreen.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(self.cardScreen)
        }
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            self.cardScreen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.cardScreen.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.cardScreen.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.cardScreen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    public func dataCollection(data:[cardDatail]) {
        self.data = data
    }
    
}

extension CardTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CardsCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as? CardsCollectionViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 160)
    }
    
}

