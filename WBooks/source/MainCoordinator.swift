//
//  MainCoordinator.swift
//  WBooks
//
//  Created by noelia.nieres on 20/08/2021.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

   /* func start() {
        let vc = WelcomeViewController()
        vc.coordinator = self
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(vc, animated: false)
    }
    
    func login() {
        let vc = LoginViewController()
        vc.coordinator = self
        vc.title = "Login"
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(vc, animated: true)
    }*/
    
    func details() {
        let vc = WishListController()
        vc.coordinator = self
        vc.title = "Sign Up"
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
    
    func start() {
        let child = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
}

extension MainCoordinator {
    func setWelcomeNavSyle() {
        navigationController.isNavigationBarHidden = true
    }
}

