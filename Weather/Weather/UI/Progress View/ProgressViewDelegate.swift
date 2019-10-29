//
//  ProgressViewDelegate.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

protocol ProgressViewDelegate {
    func add(view: UIView, isProgressView: Bool)
    
    func center(view: UIView)
    
    func bottom(view: UIView)
}
