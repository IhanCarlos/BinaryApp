//
//  CardsView.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class CardsView: UIView {

    lazy var cardMoney: UIView = {
       let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: -2)
        v.layer.shadowRadius = 10
        v.backgroundColor = .gray
        
        return v
    }()
    
    lazy var imageState: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textColor = .black
        
        return l
    }()
    
    lazy var saldoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        l.textColor = .black
        
        return l
    }()
    
    lazy var icon: UIImageView = {
       let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tintColor = .lightGray
        
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        addSubview(cardMoney)
        cardMoney.addSubview(imageState)
        cardMoney.addSubview(titleLabel)
        cardMoney.addSubview(saldoLabel)
        cardMoney.addSubview(icon)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            cardMoney.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            cardMoney.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardMoney.heightAnchor.constraint(equalToConstant: 160),
            cardMoney.widthAnchor.constraint(equalToConstant: 280),
            
            imageState.topAnchor.constraint(equalTo: cardMoney.bottomAnchor, constant: 5),
            imageState.leadingAnchor.constraint(equalTo: cardMoney.trailingAnchor, constant: 5),
            imageState.widthAnchor.constraint(equalToConstant: 15),
            imageState.heightAnchor.constraint(equalToConstant: 15),

            titleLabel.leadingAnchor.constraint(equalTo: imageState.trailingAnchor, constant: 5),
            titleLabel.centerYAnchor.constraint(equalTo: imageState.centerYAnchor),

            saldoLabel.topAnchor.constraint(equalTo: imageState.bottomAnchor, constant: 10),
            saldoLabel.leadingAnchor.constraint(equalTo: cardMoney.trailingAnchor, constant: 5),

            icon.leadingAnchor.constraint(equalTo: saldoLabel.trailingAnchor, constant: 40),
            icon.centerYAnchor.constraint(equalTo: saldoLabel.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 20),
            icon.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
}
