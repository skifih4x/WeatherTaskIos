//
//  WeekWeatherCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 20.12.2022.
//

import UIKit

final class WeekWeatherCell: UICollectionViewCell {

    static var reuseId: String = "WeekWeatherCell"

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.spacing = 15
        stack.distribution = .equalCentering
        return stack
    }()

    lazy var dayWeekLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    lazy var rainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "80%"
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = "14"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = UIColor(white: 1, alpha: 0.5)
        setupConstraints()
        dayWeekLabel.text = "2131"
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }

    func configure(with model: Lists) {
        let changeRain = "\((Int(model.rain?.the3H?.formatZero() ?? "") ?? 0) * 100)%"
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let hourString = formatter.string(from: model.dt).capitalized

        dayWeekLabel.text = "\(hourString)"
        iconImageView.image = UIImage(named: model.weather.first?.icon ?? "person.fill")
        rainLabel.text = changeRain
        maxTempLabel.text = model.main.temp_max.formatOne()
        minTempLabel.text = model.main.temp_min.formatOne()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension WeekWeatherCell {
    func setupConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(dayWeekLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(rainLabel)
        stackView.addArrangedSubview(maxTempLabel)
        stackView.addArrangedSubview(minTempLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),

            dayWeekLabel.widthAnchor.constraint(equalToConstant: 130),

            rainLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 1),
//            maxTempLabel.widthAnchor.constraint(equalToConstant: 15),
//            minTempLabel.widthAnchor.constraint(equalToConstant: 15)
        ])
    }
}
