//
//  HomeTabBarController.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 13/12/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTabs()
    }
    
    private func setupTabs() {
        let navigationController1 = UINavigationController(rootViewController: TableViewController())
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController1.tabBarItem = UITabBarItem(title: "Tableview", image: tabImage, tag: 0)
        
        let navigationController2 = UINavigationController(rootViewController: CollectionViewController())
        let tabImag = UIImage(systemName: "square.grid.3x3.topleft.filled")!
        navigationController2.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImag, tag: 1)
        
        let navigationController3 = UINavigationController(rootViewController: SettingsViewController())
        let tabImagSettings = UIImage(systemName: "screwdriver")!
        navigationController3.tabBarItem = UITabBarItem(title: "Settings", image: tabImagSettings, tag: 1)
        
        viewControllers = [navigationController1, navigationController2, navigationController3]
    }

    private func setupLayout() {
        tabBar.backgroundColor = .systemBackground
    }
}
