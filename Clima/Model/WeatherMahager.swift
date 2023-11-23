//
//  WeatherManager.swift
//  Clima
//
//  Created by macbook on 23.11.2023.
//


import Foundation
import CoreLocation

struct WeatherMahager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f7ca887d56a4b0e12d2c872017d64ec2&units=metric"
    weak var delegate: WeatherDelegate?
    
    func fetchWeather(cityName: String) {
        let stringURL = "\(weatherURL)&q=\(cityName)"
        performRequest(with: stringURL)
    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let stringURL = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: stringURL)
    }
    
    //MARK: - Request
    func performRequest(with urlString: String) {
        //Create url
        if let url = URL(string: urlString) {
            //Create urlSession
            let session = URLSession(configuration: .default)
            //Task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safedData = data {
                    if let weather = parseJSON(safedData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //start task
            task.resume()
        }
    }
    
    
    //MARK: - Parsing JSON
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather

            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
