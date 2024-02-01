//
//  LoginCoordinator.swift
//
//  Created by ihan carlos on 16/06/23.
//

import UIKit

protocol LoginCoordinatorDelegate { }

class LoginCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    var delegate: LoginCoordinatorDelegate?
    init(navCon: UINavigationController, delegate: LoginCoordinatorDelegate) {
        self.navigationController = navCon
        self.delegate = delegate
    }

    override func start() {
        showLoginScreen()
    }

    func popViewController() {
        navigationController.popViewController(animated: true)
    }
    
    func callBack() {
        navigationController.popViewController(animated: true)
    }
    
    func showLoginScreen() {
        let viewModel = LoginViewModel(delegate: self)
        let viewController: LoginViewController = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showRegisterScreen() {
        let viewModel = RegisterViewModel(delegate: self)
        let viewController: RegisterViewController = RegisterViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    func goToRegister() {
        showRegisterScreen()
    }
}

extension LoginCoordinator: RegisterViewModelCoordinatorDelegate {
    func popView() {
        callBack()
    }
}

