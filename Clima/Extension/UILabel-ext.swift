//
//  UILabel-ext.swift
//  Clima
//
//  Created by macbook on 03.10.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = nil, font: UIFont? = nil, textColor: UIColor? = nil) {
        self.init()
        
        if let text = text {
            self.text = text
        }
        
        if let font = font {
            self.font = font
        }
        
        if let textColor = textColor {
            self.textColor = textColor
        }
        
        self.backgroundColor = .clear
        self.numberOfLines = 0
    }
    
}
