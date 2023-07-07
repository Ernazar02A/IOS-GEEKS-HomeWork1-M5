//
//  NewTextField + extention.swift
//  IOS-GEEKS-HomeWork1-M5
//
//  Created by Ernazar on 7/7/23.
//

import UIKit

extension UpdateTextField {
    
    func changeSecuryPassword(_ sender: UIButton) {
        if self.isSecureTextEntry {
            let image = UIImage(systemName: "eye.fill")
            sender.setImage(image, for: .normal)
            
            self.isSecureTextEntry = false
        } else {
            let image = UIImage(systemName: "eye.slash.fill")
            sender.setImage(image, for: .normal)
            
            self.isSecureTextEntry = true
        }
    }
    
    func checkForEmptiness() -> Bool {
        if self.text?.isEmpty == true {
            self.placeholder = "Заполните, пожалуйста"
            let color: UIColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0.5)
            self.placeholderColor(color: color)
            return false
        } else {
            let color: UIColor = #colorLiteral(red: 0.6470588446, green: 0.6470588446, blue: 0.6470588446, alpha: 0.4804852214)
            self.placeholderColor(color: color)
            return true
        }
    }
    
    //for change color placeholder
    func placeholderColor(color: UIColor) {
        let placeholder = self.placeholder ?? "" //There should be a placeholder set in storyboard or elsewhere string or pass empty
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
}
