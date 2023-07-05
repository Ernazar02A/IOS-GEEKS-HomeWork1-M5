//
//  MakeView.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 30/6/23.
//

import UIKit

class MakeView {
    static let shared = MakeView()
    
    func makeLabel(
        text: String,
        bgColor: UIColor = .white,
        cornerRadius: CGFloat = 0,
        size: CGFloat = 16,
        weight: UIFont.Weight,
        color: UIColor = .black,
        alignment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.textAlignment = alignment
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight )
        label.textColor = color
        label.layer.cornerRadius = cornerRadius
        label.backgroundColor = bgColor
        return label
    }
    
    func makeTextField(
        placeholder: String,
        cornerRadius: CGFloat = 0,
        bgColor: UIColor = .white,
        text: String = ""
    ) -> UITextField {
        let textField = UITextField()
        textField.text = text
        textField.layer.cornerRadius = cornerRadius
        textField.placeholder = placeholder
        textField.backgroundColor = bgColor
        return textField
    }
    
    func makeButton(
        text: String,
        bgColor: UIColor = .white,
        cornerRadius: CGFloat = 0,
        size: CGFloat = 16,
        weight: UIFont.Weight = .regular,
        color: UIColor = .black,
        image: UIImage? = UIImage(named: "")        
    ) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: size, weight: weight)
        button.setTitleColor(color, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = bgColor
        button.setImage(image ?? UIImage(), for: .normal)
        return button
    }
}
