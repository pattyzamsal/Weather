//
//  APIRouter.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getWeatherByCityName(cityName: String)
    case getWeatherByCoordinates(lat: Int, lon: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getWeatherByCityName, .getWeatherByCoordinates:
            return .get
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getWeatherByCityName(let cityName):
            return [
                "q": cityName,
                "appid": getApiKey()
            ]
        case .getWeatherByCoordinates(let lat, let lon):
            return [
                "lat": lat,
                "lon": lon,
                "appid": getApiKey()
            ]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url: URL
        var urlRequest: URLRequest
        
        url = returnUrl()
        
        urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if let parameters = parameters {
            return try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
