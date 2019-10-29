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
    private var listDataToShow = [WeatherCellStruct]() {
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
        let nib = UINib(nibName: TextsApps.weatherCell.rawValue, bundle: nil)
        tvData.register(nib, forCellReuseIdentifier: TextsApps.weatherCell.rawValue)
    }
    
    private func findElement(icon: String) -> Int {
        var indexStruct = 0
        for i in 0..<listDataToShow.count - 1 {
            if listDataToShow[i].icon == icon {
                indexStruct = i
                break
            }
        }
        return indexStruct
    }
    
    @IBAction func onFindClick(_ sender: Any) {
        showProgress()
        presenter.getWeatherByName(cityName: "Bogotá")
//        presenter.getWeatherByCoordinates(lat: 35, lon: 139)
    }
}

extension ViewController: InitialViewProtocol {
    func onSuccessImageData(imageData: Data, icon: String) {
        let indexIcon = findElement(icon: icon)
        if indexIcon == listDataToShow.count - 1 {
            hideProgress()
        }
        listDataToShow[indexIcon].setImage(data: imageData)
    }
    
    func onSuccessWeather(weathers: [WeatherDecodable]) {
        for i in 0..<weathers.count {
            let newStruct = WeatherCellStruct(id: weathers[i].id, description: weathers[i].description, icon: weathers[i].icon)
            listDataToShow.append(newStruct)
            presenter.getImage(icon: weathers[i].icon)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDataToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvData.dequeueReusableCell(withIdentifier: TextsApps.weatherCell.rawValue) as! WeatherCell
        
        if !listDataToShow.isEmpty {
            if !listDataToShow[indexPath.row].description.isEmpty {
                cell.setupDescription(description: listDataToShow[indexPath.row].description)
            }
            if let image = listDataToShow[indexPath.row].image,
                !image.isEmpty {
                cell.setupImg(imgData: image)
            }
        }
        
        return cell
    }
}
