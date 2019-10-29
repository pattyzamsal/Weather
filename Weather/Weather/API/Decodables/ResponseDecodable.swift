//
//  ResponseDecodable.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class ResponseDecodable: Decodable {
    var weather: [WeatherDecodable]
    
    private enum CodingKeys: String, CodingKey {
        case weather
    }
}
