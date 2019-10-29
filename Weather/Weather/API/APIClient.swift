//
//  APIClient.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation
import Alamofire

func returnUrl() -> URL {
    
    let baseUrl = Bundle.main.infoDictionary?[TextsApps.baseURL.rawValue] as! String
    return try! baseUrl.asURL()
}

func getApiKey() -> String {
    
    return Bundle.main.infoDictionary?[TextsApps.apiKey.rawValue] as! String
}

class APIClient {
    
    static func validateConnectInternet() -> Bool {
        if let network = NetworkReachabilityManager() {
            return network.isReachable
        }
        return false
    }
    
    static func downloadPhoto(icon: String, completion: @escaping(Data?)-> Void) {
        let imageUrl = Bundle.main.infoDictionary?[TextsApps.imageURL.rawValue] as! String
        let urlString = imageUrl + icon + TextsApps.png.rawValue
        
        AF.request(urlString)
            .response { (defaultDataResponse) -> Void in
                if let imageData = defaultDataResponse.data {
                    completion(imageData)
                } else {
                    completion(nil)
                }
        }
    }
    
    static func getWeatherByCity(cityName: String, completion: @escaping (ResponseDecodable?)->Void) {
        AF.request(APIRouter.getWeatherByCityName(cityName: cityName) as URLRequestConvertible)
            .logRequest()
            .responseJSON { (response) in
                    switch response.result {
                    case .success:
                        if let json = response.value,
                            let data = response.data {
                            print("Success JSON: \(json)")
                            do {
                                let response = try JSONDecoder().decode(ResponseDecodable.self, from: data)
                                completion(response)
                            } catch {
                                print("Error with Decodable: \(error)")
                                completion(nil)
                            }
                        }
                    case .failure(let error):
                        print("Error \(error)")
                        completion(nil)
                    }
            }
    }
    
    static func getWeatherByCoordinates(lat: Int, lon: Int, completion: @escaping (ResponseDecodable?)->Void) {
        AF.request(APIRouter.getWeatherByCoordinates(lat: lat, lon: lon) as URLRequestConvertible)
            .logRequest()
            .responseJSON { (response) in
                    switch response.result {
                    case .success:
                        if let json = response.value,
                            let data = response.data {
                            print("Success JSON: \(json)")
                            do {
                                let response = try JSONDecoder().decode(ResponseDecodable.self, from: data)
                                completion(response)
                            } catch {
                                print("Error with Decodable: \(error)")
                                completion(nil)
                            }
                        }
                    case .failure(let error):
                        print("Error \(error)")
                        completion(nil)
                    }
            }
    }
}

extension DataRequest {
    public func logRequest() -> Self {
        self.responseData { response in
            print(response.debugDescription)
        }
        return self
    }
}
