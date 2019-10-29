//
//  APIClient.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation
import Alamofire

func returnUrl(path: String) -> URL {
    
    let baseUrl = Bundle.main.infoDictionary?[TextsApps.baseURL.rawValue] as! String
    return try! baseUrl.asURL()
}

class APIClient {
    
    static func validateConnectInternet() -> Bool {
        if let network = NetworkReachabilityManager() {
            return network.isReachable
        }
        return false
    }
    
    static func downloadPhoto(completion: @escaping(Data?)-> Void) {
        let imageUrl = Bundle.main.infoDictionary?[TextsApps.imageURL.rawValue] as! String
        AF.request(imageUrl)
            .response { (defaultDataResponse) -> Void in
                if let imageData = defaultDataResponse.data {
                    completion(imageData)
                } else {
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
