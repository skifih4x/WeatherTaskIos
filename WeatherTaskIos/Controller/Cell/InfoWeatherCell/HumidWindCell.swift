//
//  HumidWindCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit

class HumidWindCell: UITableViewCell {

    static let identifier = "HumidWindCell"

    lazy var humWindSetStackView: UIStackView = { //Добавляю humidity и wind
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var humidityStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var humidityTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        label.text = "HUMIDITY"
        return label
    }()

    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = "58%"
        return label
    }()

    lazy var windStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()

    lazy var windTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        label.text = "WIND"
        return label
    }()

    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = "s 3 km/hr"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        addSubview(humWindSetStackView)
        addSubview(humidityStackView)
        addSubview(windStackView)
        humWindSetStackView.addArrangedSubview(humidityStackView)
        humWindSetStackView.addArrangedSubview(windStackView)
        humidityStackView.addArrangedSubview(humidityTextLabel)
        humidityStackView.addArrangedSubview(humidityLabel)
        windStackView.addArrangedSubview(windTextLabel)
        windStackView.addArrangedSubview(windLabel)

        NSLayoutConstraint.activate([
            humWindSetStackView.topAnchor.constraint(equalTo: topAnchor),
            humWindSetStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            humWindSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            humWindSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func configure(model: SunRiseSet) {
        humidityTextLabel.text = "SUNRASE"
        humidityLabel.text = "\(model.sunrise)"
        windTextLabel.text = "SUNSET"
        windLabel.text = "\(model.sunset)°"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

