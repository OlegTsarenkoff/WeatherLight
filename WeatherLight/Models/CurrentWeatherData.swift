//
//  CurrentWeatherData.swift
//  WeatherLight
//
//  Created by Oleg Tsarenkoff on 25.06.21.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeatherData: Decodable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let request: [Request]
    let currentCondition: [CurrentCondition]
    let weather: [WeatherElement]
    
    enum CodingKeys: String, CodingKey {
        case request
        case currentCondition = "current_condition"
        case weather
    }
}

// MARK: - CurrentCondition
struct CurrentCondition: Decodable {
    let tempC, weatherCode: String
    let weatherDesc: [Weather]
    let feelsLikeC: String
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_C"
        case weatherCode
        case weatherDesc
        case feelsLikeC = "FeelsLikeC"
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let value: String
}

// MARK: - Request
struct Request: Decodable {
    let query: String
}

// MARK: - WeatherElement
struct WeatherElement: Decodable {
    let date: String
    let hourly: [Hourly]
}

// MARK: - Hourly
struct Hourly: Decodable {
    let time, tempC, weatherCode: String
}
