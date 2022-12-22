//
//  FeelTempPressurCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit

class FeelTempPressurCell: UITableViewCell {

    static let identifier = "FeelTempPressurCell"

    lazy var feelPresSetStackView: UIStackView = { //Добавляю feelsLike и pressure
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var feelsLikeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var feelsLikeTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.text = "FEEL LIKE"
        label.textColor = .white
        return label
    }()

    lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = "3o"
        return label
    }()

    lazy var pressureStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    lazy var pressureTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        label.text = "PRESSURE"
        return label
    }()

    lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = "1025 hPa"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        addSubview(feelPresSetStackView)
        addSubview(feelsLikeStackView)
        addSubview(pressureStackView)
        feelPresSetStackView.addArrangedSubview(feelsLikeStackView)
        feelPresSetStackView.addArrangedSubview(pressureStackView)
        feelsLikeStackView.addArrangedSubview(feelsLikeTextLabel)
        feelsLikeStackView.addArrangedSubview(feelsLikeLabel)
        pressureStackView.addArrangedSubview(pressureTextLabel)
        pressureStackView.addArrangedSubview(pressureLabel)

        NSLayoutConstraint.activate([
            feelPresSetStackView.topAnchor.constraint(equalTo: topAnchor),
            feelPresSetStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            feelPresSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feelPresSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func configure(model: SunRiseSet) {
        feelsLikeTextLabel.text = "SUNRASE"
        feelsLikeLabel.text = "\(model.sunrise)"
        pressureTextLabel.text = "SUNSET"
        pressureLabel.text = "\(model.sunset)°"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
