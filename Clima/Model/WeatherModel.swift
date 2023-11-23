//
//  WeatherModel.swift
//  Clima
//
//  Created by macbook on 23.11.2023.
//


import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Float
    var temperatureString: String {
        return String(format: "%.f", temperature)
    }
    
    var conditionName: String {
        var condition = ""
        switch conditionId {
        case 200...232:
            condition = "cloud.bolt.rain"
        case 300...321:
            condition = "cloud.drizzle"
        case 500...531:
            condition = "cloud.rain"
        case 600...622:
            condition = "cloud.snow"
        case 701...781:
            condition = "wind"
        case 800:
            condition = "sun.max"
        case 801...804:
            condition = "cloud.bolt"
        default:
            return "cloud"
        }
        return condition
    }
}
