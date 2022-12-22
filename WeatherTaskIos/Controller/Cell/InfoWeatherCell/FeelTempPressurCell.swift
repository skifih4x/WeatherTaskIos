//
//  FeelTempPressurCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit


class FeelTempPressurCell: UITableViewCell {

    static let identifier = "FeelTempPressurCell"

    lazy var feelPresSetStackView = UIStackView(.horizontal, .center, .fillEqually)

    lazy var feelsLikeStackView = UIStackView(.vertical, .center, .fillProportionally)

    lazy var feelsLikeTextLabel = UILabel("FEEL LIKE", .boldSystemFont(ofSize: 13))

    lazy var feelsLikeLabel = UILabel("0.00", .systemFont(ofSize: 28))

    lazy var pressureStackView = UIStackView(.vertical, .center, .fillProportionally)

    lazy var pressureTextLabel = UILabel("PRESSURE", .systemFont(ofSize: 13))

    lazy var pressureLabel = UILabel("1000", .boldSystemFont(ofSize: 28))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setConstraint()
    }
    private func setLayout() {
        backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        addSubview(feelPresSetStackView)
        addSubview(feelsLikeStackView)
        addSubview(pressureStackView)
        feelPresSetStackView.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeStackView.translatesAutoresizingMaskIntoConstraints = false
        pressureStackView.translatesAutoresizingMaskIntoConstraints = false
        feelPresSetStackView.addArrangedSubview(feelsLikeStackView)
        feelPresSetStackView.addArrangedSubview(pressureStackView)
        feelsLikeStackView.addArrangedSubview(feelsLikeTextLabel)
        feelsLikeStackView.addArrangedSubview(feelsLikeLabel)
        pressureStackView.addArrangedSubview(pressureTextLabel)
        pressureStackView.addArrangedSubview(pressureLabel)
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            feelPresSetStackView.topAnchor.constraint(equalTo: topAnchor),
            feelPresSetStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            feelPresSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feelPresSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func configure(model: CurrentWeatherModel) {
        feelsLikeTextLabel.text = "FEEL LIKE"
        feelsLikeLabel.text = "\(model.main.feels_like)"
        pressureTextLabel.text = "PRESSURE"
        pressureLabel.text = "\(model.main.pressure)°"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
