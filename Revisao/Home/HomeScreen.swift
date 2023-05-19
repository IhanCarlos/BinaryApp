//
//  HomeScreen.swift
//  BinaryApp
//
//  Created by ihan carlos on 10/04/23.
//
import UIKit

class HomeScreen: UIView {
    
    lazy var tableView:UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .lightGray
        tb.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
        return tb
    }()
    
    lazy var cardContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 30
        v.clipsToBounds = true
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: -2)
        v.layer.shadowRadius = 20
        v.backgroundColor = .red
        
        return v
    }()
    
    lazy var tranferenciasImage: UIButton = {
        let btn = UIButton()
        translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "arrow.left.arrow.right.square.fill"), for: .normal)
        btn.backgroundColor = .gray
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocols(delegate:UITableViewDelegate,dataSource:UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func addSubViews() {
        //addSubview(tableView)
        addSubview(cardContainerView)
        cardContainerView.addSubview(tranferenciasImage)
        
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
//            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
//            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            cardContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardContainerView.heightAnchor.constraint(equalToConstant: 80),
            
            tranferenciasImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            tranferenciasImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tranferenciasImage.heightAnchor.constraint(equalToConstant: 40),
            tranferenciasImage.widthAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
}
