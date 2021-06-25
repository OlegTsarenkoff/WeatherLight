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
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var conditionWeatherLabel: UILabel!
    @IBOutlet weak var feelLikeTempLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onCompletion = {
            currentWeather in
            
        }
        networkWeatherManager.fetchCurrentWeather(forCity: "Minsk")
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
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city) 
        }
    }
}
