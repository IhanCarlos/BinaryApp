//
//  HomeViewController.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension HomeViewController: ViewCodeType {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}
