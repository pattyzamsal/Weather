//
//  ResponseDecodable.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class ResponseDecodable: Decodable {
    var weathers: [WeatherDecodable]?
    var cod: String?
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case weathers
        case cod
        case message
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weathers = try? container.decode([WeatherDecodable].self, forKey: .weathers)
        self.cod = try? container.decode(String.self, forKey: .cod)
        self.message = try? container.decode(String.self, forKey: .message)
    }
}
