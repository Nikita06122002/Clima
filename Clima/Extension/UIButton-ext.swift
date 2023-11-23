//
//  UIButton-ext.swift
//  Clima
//
//  Created by macbook on 06.10.2023.
//

import UIKit


extension UIButton {
    
    convenience init(title: String? = nil, titleColor: UIColor? = nil, setImage: UIImage? = nil, font: CGFloat? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = 0) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setImage(setImage, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius!
        if let fontSize = font {
                self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            }
        self.sizeToFit()
    }

    
}
