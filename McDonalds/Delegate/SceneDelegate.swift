//
//  SceneDelegate.swift
//  McDonalds
//
//  Created by Denis on 20/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        
        let discountVC = DiscountViewController()
        let menuVC = MenuViewController()
        
        let discountNavController = UINavigationController(rootViewController: discountVC)
        let menuNavController = UINavigationController(rootViewController: menuVC)
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([discountNavController, menuNavController], animated: true)
        discountNavController.tabBarItem = UITabBarItem(title: "Offer", image: UIImage(named: "discount"), tag: 0)
        menuNavController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu"), tag: 1)
        
        window = UIWindow(windowScene: winScene)
        window?.rootViewController = tabBarVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

