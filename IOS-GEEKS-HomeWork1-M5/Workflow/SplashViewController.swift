//
//  SplashViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 2/7/23.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let keyChain = KeychainStorage.shared
    private let encoder = JSONDecoder()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        if
            let data = keyChain.get(
                service: Constants.Authorization.service,
                account: Constants.Authorization.account
            ),
            let date = try? decoder.decode(Date.self, from: data),
                date > Date() {
            print(date)
            print(Date())
            let vc = RickAndMortyViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
        } else {
            let vc = AuthorizationViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
        }
    }
}
