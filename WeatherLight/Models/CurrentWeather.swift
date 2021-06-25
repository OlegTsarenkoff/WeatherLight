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
    
// Вот тут у меня начался многочасовой тормоз, тк не понимаю как мне вынять данные :(
    let hourly: String
    
    
    var systemIconNameString: String {
        switch weatherCode {
        case "113": return "sun.max.fill"
        case "116": return "cloud.sun.fill"
        case "119", "122", "143": return "cloud.fill"
        case "176", "179", "182": return "cloud.sun.rain.fill"
        case "200": return "cloud.sun.bolt.fill"
        case "227", "230", "317", "320", "323", "329", "335", "338", "350", "368", "371", "374", "377": return "cloud.snow"
        case "248", "260", "263", "266", "281", "284", "296", "302", "308", "311", "314": return "cloud.rain.fill"
        case "353", "356", "359", "362", "265": return "cloud.sun.rain.fill"
        case "386", "389", "392", "395": return "cloud.bolt.fill"
        default: return "nosign"
        }
        
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.data.request.first!.query
        currentTemp = currentWeatherData.data.currentCondition.first!.tempC
        feelsLikeTemp = currentWeatherData.data.currentCondition.first!.feelsLikeC
        weatherCode = currentWeatherData.data.currentCondition.first!.weatherCode
        conditionWeather = currentWeatherData.data.currentCondition.first!.weatherDesc.first!.value
        
//Ну и соответсвенно тут полный бред, тк мне каждое значение time нужно, чтобы назначить temp и icon
        hourly = currentWeatherData.data.weather.first!.hourly.first!.time
    }
}
