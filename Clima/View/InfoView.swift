//
//  InfoView.swift
//  Clima
//
//  Created by macbook on 23.11.2023.
//


import UIKit

final class InfoView: UIView {
    
    init() {
        super.init(frame: .infinite)
        setupView()
        setupConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let city = UILabel(text: "City", font: .systemFont(ofSize: 60))
    private let sunImage = UIImageView(image: UIImage(systemName: "sun.max"))
    
    private let numberLabel = UILabel(text: "0", font: .boldSystemFont(ofSize: 80))
    private let degreeLabel = UILabel(text: "°", font: .systemFont(ofSize: 100))
    private lazy var temperatureStack = UIStackView(.horizontal, 0, .fill, .fillEqually, [numberLabel, degreeLabel])
    
    private func setupView() {
        self.addSubViews(city, temperatureStack, sunImage)
        
        sunImage.tintColor = .label
        city.textAlignment = .center
    }
    
    private func setupConst() {
        NSLayoutConstraint.activate([
            city.topAnchor.constraint(equalTo: self.topAnchor),
            city.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            city.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor),
            city.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor),
            
            temperatureStack.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 20),
            temperatureStack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 30),
            
            sunImage.topAnchor.constraint(equalTo: temperatureStack.bottomAnchor, constant: 40),
            sunImage.heightAnchor.constraint(equalToConstant: 150),
            sunImage.widthAnchor.constraint(equalTo: sunImage.heightAnchor),
            sunImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    
    //MARK: - Open funcs
    
    func updateNumberLabel(for text: String) {
        numberLabel.text = text
    }
    
    func updateSunImage(for image: String) {
        sunImage.image = UIImage(systemName: image)
    }
    
    func updateCityText(for text: String) {
        city.text = text
    }
}
