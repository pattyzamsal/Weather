//
//  WeatherCell.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    func setupData(imgData: Data, description: String) {
        lblDescription.text = description
        imgIcon.image = UIImage(data: imgData, scale: 1)
    }
}
