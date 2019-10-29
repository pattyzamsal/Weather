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
                    self.onSuccessImageData(imageData: imgData)
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
            APIClient.getWeatherByCity(cityName: cityName) { (weathers) in
                if let weathersArray = weathers {
                    self.onSuccessWeather(weathers: weathersArray)
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
            APIClient.getWeatherByCoordinates(lat: lat, lon: lon) { (weathers) in
                if let weathersArray = weathers {
                    self.onSuccessWeather(weathers: weathersArray)
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
    func onSuccessImageData(imageData: Data) {
        self.view.onSuccessImageData(imageData: imageData)
    }
    
    func onSuccessWeather(weathers: [WeatherDecodable]) {
        self.view.onSuccessWeather(weathers: weathers)
    }
}
