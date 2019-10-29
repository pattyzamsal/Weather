//
//  BaseModel.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//
//  MVP architecture pattern.
//

import Foundation

class BaseModel {
    
    private var view: BaseViewProtocol
    
    init(view: BaseViewProtocol) {
        self.view = view
    }
}

extension BaseModel: BaseModelProtocol {
    func sendMessage(title: String, message: String) {
        self.view.alertErrors(title: title, message: message)
    }
}
