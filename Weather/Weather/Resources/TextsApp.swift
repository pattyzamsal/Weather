//
//  TextsApp.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

enum TextsApps: String {
    
    //MARK: constants
    case baseURL = "Base Url"
    case imageURL = "Image Url"
    case apiKey = "Api Key"
    case png = ".png"
    
    //MARK: alerts
    case cancel = "Cancel"
    case accept = "Accept"
    case loading = "loading"
    
    //MARK: Initial view
    case description = "Introduce a city or coordinate in this format (x, y) to see the weather"
    case find = "Search"
    
    //MARK: errors
    case withoutInternetTitle = "Without connection"
    case withoutInternetMessage = "Please, review your connection to internet"
    case errorWithDownloadTitle = "Something wrong happened"
    case errorWithDownloadMessage = "Your request cann't be processed, try again"
    
    //MARK: objects in the app
    case progressView = "ProgressView"
    case weatherCell = "WeatherCell"
}
