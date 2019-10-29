//
//  InitialPresenter.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

protocol InitialViewProtocol: BaseViewProtocol {
    func onSuccessImageData(imageData: Data)
    func onSuccessWeather(weathers: [WeatherDecodable])
}

protocol InitialModelProtocol: BaseModelProtocol {
    func onSuccessImageData(imageData: Data)
    func onSuccessWeather(weathers: [WeatherDecodable])
}
