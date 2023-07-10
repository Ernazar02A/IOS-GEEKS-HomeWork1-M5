//
//  CustomView.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 10/7/23.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor.systemBackground
    }
    
    func layoutViews() {
        
    }
}
