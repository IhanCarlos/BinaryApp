//
//  ButtonsScreen.swift
//  BinaryApp
//
//  Created by ihan carlos on 01/05/23.
//

import UIKit

class ButtonsScreen: UIView {
    
    lazy var extratoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "newspaper.fill"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.tintColor = .black
        
        return button
    }()
    
    lazy var transferenciasButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left.arrow.right.square.fill"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    lazy var depositarButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.uturn.down.square.fill"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    lazy var payButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.viewfinder"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        addSubview(extratoButton)
        addSubview(transferenciasButton)
        addSubview(depositarButton)
        addSubview(payButton)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            extratoButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            extratoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            extratoButton.heightAnchor.constraint(equalToConstant: 60),
            extratoButton.widthAnchor.constraint(equalToConstant: 60),
            
            transferenciasButton.leadingAnchor.constraint(equalTo: self.extratoButton.trailingAnchor, constant: 5),
            transferenciasButton.centerYAnchor.constraint(equalTo: extratoButton.centerYAnchor),
            transferenciasButton.heightAnchor.constraint(equalToConstant: 150),
            transferenciasButton.widthAnchor.constraint(equalToConstant: 150),
            
            depositarButton.leadingAnchor.constraint(equalTo: self.transferenciasButton.trailingAnchor, constant: 5),
            depositarButton.centerYAnchor.constraint(equalTo: extratoButton.centerYAnchor),
            depositarButton.heightAnchor.constraint(equalToConstant: 150),
            depositarButton.widthAnchor.constraint(equalToConstant: 150),
            
            payButton.leadingAnchor.constraint(equalTo: self.depositarButton.trailingAnchor, constant: 5),
            payButton.centerYAnchor.constraint(equalTo: extratoButton.centerYAnchor),
            payButton.heightAnchor.constraint(equalToConstant: 150),
            payButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
