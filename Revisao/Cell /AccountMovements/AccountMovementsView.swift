//
//  AccountMovementsView.swift
//  BinaryApp
//
//  Created by ihan carlos on 03/05/23.
//

import UIKit

class AccountMovementsView: UIView {

    lazy var userImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "newspaper.fill")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.tintColor = .black
        image.backgroundColor = .orange
        
        return image
    }()
    
    lazy var labelExtrato: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Extrato"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setUpConstraints()
    }
    
    func addSubview() {
        addSubview(userImageView)
        addSubview(labelExtrato)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        private func setUpConstraints() {
            NSLayoutConstraint.activate([
                userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
                userImageView.heightAnchor.constraint(equalToConstant: 50),
                userImageView.widthAnchor.constraint(equalToConstant: 50),
                
                labelExtrato.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
                labelExtrato.centerXAnchor.constraint(equalTo: userImageView.centerXAnchor),
            ])
        }
}
