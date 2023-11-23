//
//  UIView-ext.swift
//  Clima
//
//  Created by macbook on 28.09.2023.
//

import UIKit

extension UIView {
    
    convenience init(color: UIColor = .clear, radius: CGFloat = 0) {
        self.init()
        self.backgroundColor = color
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
    func fillConstraint(top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        guard let view = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing)
        ])
    }
    
}
