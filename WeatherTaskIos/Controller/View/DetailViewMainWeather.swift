//
//  DetailViewMainWeather.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 18.12.2022.
//

import UIKit

class DetailViewMainWeather: UIView {

    lazy private var mainStackView = UIStackView(.vertical, .center, .equalSpacing, 10)

    lazy private var cityTempWeatherStackView = UIStackView(.vertical)

    lazy private var minAndMaxStackView = UIStackView(.horizontal, 10)

    lazy private var cityLabel = UILabel("City", .systemFont(ofSize: 34), .center)

    lazy private var temperatureLabel = UILabel("7°C", .systemFont(ofSize: 80), .center)

    lazy private var weatherLabel = UILabel("Mostly Cloudy", .systemFont(ofSize: 20), .center)

    lazy private var maxTempLabel = UILabel("H:8°C", .systemFont(ofSize: 20), .center)

    lazy private var minTempLabel  = UILabel("L:0°C", .systemFont(ofSize: 20), .center)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    private func setLayout() {
        addSubview(mainStackView)
        addSubview(cityTempWeatherStackView)
        addSubview(minAndMaxStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        cityTempWeatherStackView.translatesAutoresizingMaskIntoConstraints = false
        minAndMaxStackView.translatesAutoresizingMaskIntoConstraints = false

        cityTempWeatherStackView.addArrangedSubview(cityLabel)
        cityTempWeatherStackView.addArrangedSubview(temperatureLabel)
        cityTempWeatherStackView.addArrangedSubview(weatherLabel)
        minAndMaxStackView.addArrangedSubview(maxTempLabel)
        minAndMaxStackView.addArrangedSubview(minTempLabel)
        mainStackView.addArrangedSubview(cityTempWeatherStackView)
        mainStackView.addArrangedSubview(minAndMaxStackView)

        mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    func configure(model: CurrentWeatherModel) {
        cityLabel.text = model.name
        temperatureLabel.text = "\(model.main.temp.formatZero())°"
        weatherLabel.text = model.weather.first?.description.capitalized
        maxTempLabel.text = "H:\(model.main.temp_max.formatZero())°"
        minTempLabel.text = "L:\(model.main.temp_min.formatZero())°"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

