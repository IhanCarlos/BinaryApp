//
//  RegisterViewModel.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import Foundation

protocol RegisterViewModelCoordinatorDelegate {
    func popView()
}

class RegisterViewModel: RegisterViewModelCoordinatorDelegate {

    private var delegate: RegisterViewModelCoordinatorDelegate?

    init(delegate: RegisterViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }

    func popView() {
        delegate?.popView()
    }
}
