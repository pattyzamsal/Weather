//
//  WeatherDecodable.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class WeatherDecodable: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}
