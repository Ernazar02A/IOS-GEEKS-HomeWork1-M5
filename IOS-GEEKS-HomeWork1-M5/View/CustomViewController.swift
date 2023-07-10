//
//  CustomViewController.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 10/7/23.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        view as! V
    }
}
