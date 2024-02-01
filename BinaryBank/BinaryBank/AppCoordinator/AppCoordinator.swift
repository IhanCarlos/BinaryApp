//
//  AppCoordinator.swift
//  BinaryBank
//
//  Created by ihan carlos on 31/01/24.
//

import Foundation

import UIKit

class AppCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    init(navCon: UINavigationController) {
        self.navigationController = navCon
    }
    override func start() {
        goToLoginPage()
        navigationController.isNavigationBarHidden = true
    }
    func goToLoginPage() {
        let loginCoordinator = LoginCoordinator(
        navCon: navigationController,
        delegate: self
        )
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate { }
