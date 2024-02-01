//
//  LoginViewModel.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import Foundation

protocol LoginViewModelCoordinatorDelegate {
    func goToRegister()
}

class LoginViewModel: LoginViewModelCoordinatorDelegate {

    private var delegate: LoginViewModelCoordinatorDelegate?

    init(delegate: LoginViewModelCoordinatorDelegate) {
        self.delegate = delegate
    }

    func goToRegister() {
        delegate?.goToRegister()
    }
}
