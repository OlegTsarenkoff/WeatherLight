//
//  ViewController+alertController.swift
//  WeatherLight
//
//  Created by Oleg Tsarenkoff on 25.06.21.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { tf in
            let cities = ["Moscow", "Minsk", "Kiev", "Warsaw", "Vilnius", "Riga", "New York", "Berlin", "Tokyo", "Los Angeles", "Madrid"]
            tf.placeholder = "Please, enter city (e.g.: \(cities.randomElement() ?? "Minsk"))"
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
//          self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        let cansel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cansel)
        present(alertController, animated: true, completion: nil)
    }
}


