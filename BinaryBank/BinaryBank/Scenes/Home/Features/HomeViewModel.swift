//
//  HomeViewModel.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate {
}

class HomeViewModel: HomeViewModelCoordinatorDelegate {

    private var delegate: HomeViewModelCoordinatorDelegate?

    init(delegate: HomeViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }
}
