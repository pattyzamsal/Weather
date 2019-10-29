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
    
    func getImage() {
        if APIClient.validateConnectInternet() {
            APIClient.downloadPhoto() { (imageData) in
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
}

extension InitialModel: InitialModelProtocol {
    func onSuccessImageData(imageData: Data) {
        self.view.onSuccessImageData(imageData: imageData)
    }
}
