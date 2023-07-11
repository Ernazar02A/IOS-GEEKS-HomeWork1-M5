//
//  MainTabBarViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 6/7/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTabVC = UINavigationController(rootViewController: RickAndMortyViewController())
        let secondTabVC = UINavigationController(rootViewController: AddCharacterViewController())
        let thirdTabVC = UINavigationController(rootViewController: UpdateCharacterViewController())
        
        firstTabVC.tabBarItem.image = UIImage(systemName: "person")
        secondTabVC.tabBarItem.image = UIImage(systemName: "person.crop.rectangle.badge.plus")
        thirdTabVC.tabBarItem.image = UIImage(systemName: "plus.rectangle.on.folder")
        
        firstTabVC.title = "character"
        secondTabVC.title = "Add Product"
        thirdTabVC.title = "Add Character"
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        
        setViewControllers([firstTabVC,secondTabVC,thirdTabVC], animated: true)
    }
}
