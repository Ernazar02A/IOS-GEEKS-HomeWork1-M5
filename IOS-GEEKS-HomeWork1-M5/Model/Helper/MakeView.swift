//
//  MakeView.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 30/6/23.
//

import UIKit

class MakeView {
    static let shared = MakeView()
    
    func makeLabel(text: String,
                   bgColor: UIColor = .white,
                   cornerRadius: CGFloat = 0,
                   size: CGFloat = 16,
                   weight: UIFont.Weight,
                   color: UIColor = .black
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight )
        label.textColor = color
        label.layer.cornerRadius = cornerRadius
        label.backgroundColor = bgColor
        return label
    }
}
