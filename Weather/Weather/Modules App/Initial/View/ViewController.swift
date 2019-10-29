//
//  ViewController.swift
//  Weather
//
//  Created by Patricia Zambrano on 10/28/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class ViewController: BaseVC {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
     @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tfCityCoordinate: UITextField!
    @IBOutlet weak var btnFind: UIButton!
    @IBOutlet weak var tvData: UITableView!
    
    private lazy var presenter = InitialModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        showProgress()
        presenter.getImage(icon: "02d")
    }
    
    
    private func setupView() {
        lblDescription.text = TextsApps.description.rawValue
        btnFind.setTitle(TextsApps.find.rawValue, for: .normal)
    }
    
    @IBAction func onFindClick(_ sender: Any) {
        showProgress()
        presenter.getWeatherByName(cityName: "Bogotá")
        presenter.getWeatherByCoordinates(lat: 35, lon: 139)
    }
}

extension ViewController: InitialViewProtocol {
    func onSuccessImageData(imageData: Data) {
        hideProgress()
        imgLogo.image = UIImage(data: imageData, scale:1)
    }
    
    func onSuccessWeather(weathers: [WeatherDecodable]) {
        hideProgress()
        print("icon: \(weathers[0].icon)")
    }
}
