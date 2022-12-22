//
//  HumidWindCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit

class HumidWindCell: UITableViewCell {

    static let identifier = "HumidWindCell"

    private lazy var humWindSetStackView = UIStackView(.horizontal, .center, .fillEqually)

    private lazy var humidityStackView = UIStackView(.vertical, .center, .fillProportionally)

    private lazy var humidityTextLabel = UILabel("HUMIDITY", .systemFont(ofSize: 13))

    private lazy var humidityLabel = UILabel("100", .boldSystemFont(ofSize: 28))

    private lazy var windStackView = UIStackView(.vertical, .center, .fillProportionally)

    private lazy var windTextLabel = UILabel("WIND", .systemFont(ofSize: 13))

    private lazy var windLabel = UILabel("3ms", .boldSystemFont(ofSize: 28))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setConstraint()
    }

    private func setLayout() {
        backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        addSubview(humWindSetStackView)
        addSubview(humidityStackView)
        addSubview(windStackView)
        humWindSetStackView.translatesAutoresizingMaskIntoConstraints = false
        humidityStackView.translatesAutoresizingMaskIntoConstraints = false
        windStackView.translatesAutoresizingMaskIntoConstraints = false
        humWindSetStackView.addArrangedSubview(humidityStackView)
        humWindSetStackView.addArrangedSubview(windStackView)
        humidityStackView.addArrangedSubview(humidityTextLabel)
        humidityStackView.addArrangedSubview(humidityLabel)
        windStackView.addArrangedSubview(windTextLabel)
        windStackView.addArrangedSubview(windLabel)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            humWindSetStackView.topAnchor.constraint(equalTo: topAnchor),
            humWindSetStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            humWindSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            humWindSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func configure(model: CurrentWeatherModel) {
        humidityTextLabel.text = "HUMIDITY"
        humidityLabel.text = "\(model.main.humidity)"
        windTextLabel.text = "WIND"
        windLabel.text = "\(model.wind.speed)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

