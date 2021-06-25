//
//  CurrentWeather.swift
//  WeatherLight
//
//  Created by Oleg Tsarenkoff on 25.06.21.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    let currentTemp: String
    let feelsLikeTemp: String
    let weatherCode: String
    let conditionWeather: String
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.data.request.first!.query
        currentTemp = currentWeatherData.data.currentCondition.first!.tempC
        feelsLikeTemp = currentWeatherData.data.currentCondition.first!.feelsLikeC
        weatherCode = currentWeatherData.data.currentCondition.first!.weatherCode
        conditionWeather = currentWeatherData.data.currentCondition.first!.weatherDesc.first!.value
    }
}
