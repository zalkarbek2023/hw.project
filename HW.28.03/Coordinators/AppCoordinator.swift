//
//  AppCoordinator.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var isLoggedIN: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showMain()
    }
    
    func showMain() {
        let vc = MainViewController.createObject()
        vc.coordinator = self
        vc.userViewModel = UserViewModel()
        vc.userViewModel?.isLoggedIn = isLoggedIN
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showLogin() {
        let vc = LoginViewController.createObject()
        vc.coordinator = self
        vc.userViewModel = UserViewModel()
        vc.userViewModel?.isLoggedIn = isLoggedIN
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTabBar() {
        let vc = TabViewController.createObject()
        vc.coordinator = self
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

