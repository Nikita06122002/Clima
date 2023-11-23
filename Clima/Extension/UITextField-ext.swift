//
//  UITextField-ext.swift
//  Clima
//
//  Created by macbook on 26.10.2023.
//

import UIKit

extension UITextField {
    
    convenience init(borderStyle: BorderStyle? = nil, font: UIFont? = nil, placeholder: String? = nil, backgroundColor: UIColor? = nil) {
        self.init(frame: .infinite)
        if let border = borderStyle {
            self.borderStyle = border

        }
        if let font = font {
            self.font = font
        }
        if let placeholder = placeholder {
            self.placeholder = placeholder
        }
        if let color = backgroundColor {
            self.backgroundColor = color
        }
    }
}
