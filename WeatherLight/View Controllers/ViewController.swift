//
//  ViewController.swift
//  WeatherLight
//
//  Created by Oleg Tsarenkoff on 25.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var currentData: UIDatePicker!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var conditionWeatherLabel: UILabel!
    @IBOutlet weak var feelLikeTempLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var nightImageWeather: UIImageView!
    @IBOutlet weak var nightTemp: UILabel!
    
    @IBOutlet weak var morningImageWeather: UIImageView!
    @IBOutlet weak var morningTemp: UILabel!
    
    @IBOutlet weak var dayImageWeather: UIImageView!
    @IBOutlet weak var dayTemp: UILabel!
    
    @IBOutlet weak var eveningImageWeather: UIImageView!
    @IBOutlet weak var eveningTemp: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onCompletion = { [weak self]
            currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Minsk")
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityNameLabel?.text = weather.cityName
            self.conditionWeatherLabel.text = weather.conditionWeather
            self.feelLikeTempLabel.text = weather.feelsLikeTemp
            self.temperatureLabel.text = weather.currentTemp
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
            self.nightTemp.text = weather.hourly[0].tempC
            //self.nightImageWeather.image = UIImage(systemName: weather.hourly[0].weatherCode)
            self.morningTemp.text = weather.hourly[1].tempC
            //self.morningImageWeather.image = UIImage(systemName: weather.hourly[0].weatherCode)
            self.dayTemp.text = weather.hourly[2].tempC
            //self.dayImageWeather.image = UIImage(systemName: weather.hourly[0].weatherCode)
            self.eveningTemp.text = weather.hourly[3].tempC
            //self.eveningImageWeather.image = UIImage(systemName: weather.hourly[0].weatherCode)
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func switchTheme(_ sender: UISwitch) {
        if themeSwitch.isOn {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city) 
        }
    }
}
