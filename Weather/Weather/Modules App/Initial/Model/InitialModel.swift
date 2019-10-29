//
//  InitialModel.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class InitialModel: BaseModel {
    private var view: InitialViewProtocol
    
    init(view: InitialViewProtocol) {
        self.view = view
        super.init(view: view)
    }
    
    func getImage(icon: String) {
        if APIClient.validateConnectInternet() {
            APIClient.downloadPhoto(icon: icon) { (imageData) in
                if let imgData = imageData {
                    self.onSuccessImageData(imageData: imgData, icon: icon)
                } else {
                    self.sendMessage(title: TextsApps.errorWithDownloadTitle.rawValue, message: TextsApps.errorWithDownloadMessage.rawValue)
                }
            }
        } else {
            self.sendMessage(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
        }
    }
    
    func getWeatherByName(cityName: String) {
        if APIClient.validateConnectInternet() {
            APIClient.getWeatherByCity(cityName: cityName) { (response) in
                if let res = response {
                    if let weathers = res.weathers {
                        self.onSuccessWeather(weathers: weathers)
                    }
                    if let cod = res.cod,
                        let message = res.message,
                        cod == "404" {
                        self.sendMessage(title: TextsApps.error.rawValue, message: message.capitalized)
                    }
                } else {
                    self.sendMessage(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
                }
            }
        } else {
            self.sendMessage(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
        }
    }
    
    func getWeatherByCoordinates(lat: Int, lon: Int) {
        if APIClient.validateConnectInternet() {
            APIClient.getWeatherByCoordinates(lat: lat, lon: lon) { (response) in
                if let res = response {
                    if let weathers = res.weathers {
                        self.onSuccessWeather(weathers: weathers)
                    }
                    if let cod = res.cod,
                        let message = res.message,
                        cod == "404" {
                        self.sendMessage(title: TextsApps.error.rawValue, message: message.capitalized)
                    }
                } else {
                    self.sendMessage(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
                }
            }
        } else {
            self.sendMessage(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
        }
    }
}

extension InitialModel: InitialModelProtocol {
    func onSuccessImageData(imageData: Data, icon: String) {
        self.view.onSuccessImageData(imageData: imageData, icon: icon)
    }
    
    func onSuccessWeather(weathers: [WeatherDecodable]) {
        self.view.onSuccessWeather(weathers: weathers)
    }
}
