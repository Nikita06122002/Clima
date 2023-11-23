//
//  WeatherController.swift
//  Clima
//
//  Created by macbook on 23.11.2023.
//

import UIKit
import CoreLocation

class WeatherController: UIViewController {
    
    private let searchView = SearchView()
    private let infoView = InfoView()
    
    private var weatherManager = WeatherMahager()
    private let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        addTargets()
        searchView.textField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
    }
    
    private func setupView() {
        
        view.addSubViews(searchView, infoView)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        searchView.isUserInteractionEnabled = true
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            infoView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 50),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    private func addTargets() {
        searchView.searchButtonTarget(self, action: #selector(searchAction))
        searchView.locationTarget(self, action: #selector(locationAction))
    }
    
    
    
    @objc private func searchAction() {
        searchView.endEditing()
    }
    
    @objc func locationAction() {
        DispatchQueue.main.async {
            self.locationManager.requestLocation()
        }
        
    }
    
}


//MARK: - TextFieldDelegate
extension WeatherController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManager.fetchWeather(cityName: city)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            searchView.updatePlaceholder("Add city!")
            return false
        }
    }
}

//MARK: - Weather Delegate
extension WeatherController: WeatherDelegate {
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didUpdateWeather(_ weatherManager: WeatherMahager, weather: WeatherModel) {
        print(weather.temperatureString)
        DispatchQueue.main.async {
            self.infoView.updateNumberLabel(for: weather.temperatureString)
            self.infoView.updateCityText(for: weather.cityName)
            self.infoView.updateSunImage(for: weather.conditionName)
            
        }
    }
}

//MARK: - LocationDelegate

extension WeatherController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Локация получена --->")
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat: lat, lon: lon)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Локация не была получена")
    }
}

//MARK: - SwiftUI
import SwiftUI
struct Provider_WeatherController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return WeatherController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = WeatherController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_WeatherController.ContainterView>) -> WeatherController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_WeatherController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_WeatherController.ContainterView>) {
            
        }
    }
    
}
