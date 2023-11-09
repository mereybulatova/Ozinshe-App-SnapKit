//
//  TabBarController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 01.11.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    func setupTabs() {
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let favoriteVC = FavoriteViewController()
        let profileVC = ProfileViewController()
        
        homeVC.title = "Тізім"
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), selectedImage: UIImage(named: "homeActive"))
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "search"), selectedImage: UIImage(named: "searchActive"))
        favoriteVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "favorites"), selectedImage: UIImage(named: "favoritesActive"))
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profile"), selectedImage: UIImage(named: "homeActive"))
        
        setViewControllers([homeVC, searchVC, favoriteVC, profileVC], animated: false)
    }
}
