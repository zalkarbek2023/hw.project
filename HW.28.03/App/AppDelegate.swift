//
//  AppDelegate.swift
//  HW.28.03
//
//  Created by zalkarbek on 28/3/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navContr = UINavigationController()
        coordinator = AppCoordinator(navigationController: navContr)
        coordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navContr
        window?.makeKeyAndVisible()
        return true
    }

}

