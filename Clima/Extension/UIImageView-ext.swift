//
//  UIImageView-ext.swift
//  Clima
//
//  Created by macbook on 06.11.2023.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage) {
        self.init(frame: .infinite)
        self.clipsToBounds = true
        self.image = image
        
    }
}
