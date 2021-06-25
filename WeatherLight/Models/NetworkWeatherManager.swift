//
//  NetworkWeatherManager.swift
//  WeatherLight
//
//  Created by Oleg Tsarenkoff on 25.06.21.
//

import Foundation

struct NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.worldweatheronline.com/premium/v1/weather.ashx?key=\(apiKey)&q=\(city)&format=json&num_of_days=0&mca=no&fx24=no&show_comments=no&tp=6&alerts=no&aqi=no"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
       return nil
    }
}
