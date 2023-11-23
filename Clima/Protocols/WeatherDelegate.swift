//
//  WeatherProtocol.swift
//  Clima
//
//  Created by macbook on 23.11.2023.
//

import Foundation

protocol WeatherDelegate: AnyObject {
    func didUpdateWeather(_ weatherManager: WeatherMahager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
