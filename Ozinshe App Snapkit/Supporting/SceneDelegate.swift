//
//  SceneDelegate.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 30.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let navController = UINavigationController(rootViewController: SignInViewController())
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        if let windowScene = scene as? UIWindowScene {
            if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
                Storage.sharedInstance.accessToken = accessToken
                
                self.window = UIWindow(windowScene: windowScene)
                let viewController = TabBarController()
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            }
        }
    }
}
