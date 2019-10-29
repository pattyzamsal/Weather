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
     @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var tfCityCoordinate: UITextField!
    @IBOutlet weak var btnFind: UIButton!
    @IBOutlet weak var tvData: UITableView!
    
    private lazy var presenter = InitialModel(view: self)
    private var listOfWeathers = [WeatherDecodable]()
    private var dataToShow = [(imgData: Data, description: String)]() {
        didSet {
            tvData.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        lblDescription.text = TextsApps.description.rawValue
        btnFind.setTitle(TextsApps.find.rawValue, for: .normal)
        tvData.delegate = self
        tvData.dataSource = self
        let nib = UINib(nibName: "WeatherCell", bundle: nil)
        tvData.register(nib, forCellReuseIdentifier: "WeatherCell")
    }
    
    @IBAction func onFindClick(_ sender: Any) {
        showProgress()
        presenter.getWeatherByName(cityName: "Bogotá")
//        presenter.getWeatherByCoordinates(lat: 35, lon: 139)
    }
}

extension ViewController: InitialViewProtocol {
    func onSuccessImageData(imageData: Data) {
        hideProgress()
//        dataToShow[indexWeather].imgData = imageData
//        tvData.reloadData()
    }
    
    func onSuccessWeather(weathers: [WeatherDecodable]) {
        hideProgress()
        for weather in weathers {
            let newWeather = (imgData: Data(), description: weather.description)
            dataToShow.append(newWeather)
//            presenter.getImage(icon: weather.icon)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvData.dequeueReusableCell(withIdentifier: TextsApps.weatherCell.rawValue) as! WeatherCell
        
        if !dataToShow.isEmpty {
            if !dataToShow[indexPath.row].imgData.isEmpty {
                cell.setupImg(imgData: dataToShow[indexPath.row].imgData)
            }
            if !dataToShow[indexPath.row].description.isEmpty {
                cell.setupDescription(description: dataToShow[indexPath.row].description)
            }
        }
        
        return cell
    }
}
