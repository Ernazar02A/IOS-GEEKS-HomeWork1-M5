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

        let vc1 = UINavigationController(rootViewController: RickAndMortyViewController())
        let vc2 = UINavigationController(rootViewController: AddCharacterViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "person")
        vc2.tabBarItem.image = UIImage(systemName: "person.crop.rectangle.badge.plus")
        
        vc1.title = "character"
        vc2.title = "Add Product"
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        
        setViewControllers([vc1,vc2], animated: true)
    }
}
