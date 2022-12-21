//
//  DetailViewMainWeather.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 18.12.2022.
//

import UIKit

class DetailViewMainWeather: UIView {

    lazy private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy private var cityTempWeatherStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy private var minAndMaxStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy private var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34)
        label.text = "City"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80)
        label.text = "7°C"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Mostly Cloudy"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var maxTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "H:8°C"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy private var minTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "L:0°C"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(mainStackView)
        addSubview(cityTempWeatherStackView)
        addSubview(minAndMaxStackView)
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
        temperatureLabel.text = "\(model.main.temp)°"
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

