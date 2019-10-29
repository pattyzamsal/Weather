//
//  WeatherCellStruct.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/29/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

struct WeatherCellStruct {
    var id: Int
    var description: String
    var icon: String
    var image: Data?
    
    init(id: Int, description: String, icon: String) {
        self.id = id
        self.description = description
        self.icon = icon
    }
    
    mutating func setImage(data: Data) {
        self.image = data
    }
}
