//
//  SearchView.swift
//  Clima
//
//  Created by macbook on 23.11.2023.
//

import UIKit

final class SearchView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let locationButton = UIButton(setImage: UIImage(systemName: "location.circle.fill"))
    private let searchTextField = UITextField(font: .systemFont(ofSize: 25), placeholder: "Search", backgroundColor: .systemGray5)
    public var textField: UITextField {
        return searchTextField
    }
    private let searchButton = UIButton(setImage: UIImage(systemName: "magnifyingglass"))
    private lazy var searchStack = UIStackView(.horizontal, 10, .center, .fill, [locationButton, searchTextField, searchButton])
    
    private func setupView() {
        self.addSubViews(searchStack)
        locationButton.tintColor = .label
        searchButton.tintColor = .label
        
        searchTextField.textAlignment = .center
        searchTextField.layer.cornerRadius = 10
        searchTextField.alpha = 0.4
        searchTextField.tintColor = .label
        searchTextField.autocapitalizationType = .words
        
        searchTextField.isUserInteractionEnabled = true
    }
    
    private func setupConst() {
        NSLayoutConstraint.activate([
            searchStack.topAnchor.constraint(equalTo: self.topAnchor),
            searchStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            searchStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            searchStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            searchTextField.widthAnchor.constraint(equalToConstant: 300)
        ])
     
    }
    
    //MARK: - Open funcs
    
    func endEditing() {
        searchTextField.endEditing(true)
    }
    
    func updatePlaceholder(_ placeholder: String) {
        searchTextField.placeholder = placeholder
    }
    
    func searchButtonTarget(_ target: Any, action: Selector) {
        searchButton.addTarget(target, action: action, for: .touchUpInside)
    }
    func locationTarget(_ target: Any, action: Selector) {
        locationButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    
}
