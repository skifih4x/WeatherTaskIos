//
//  HoursWeatherCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 20.12.2022.
//

import UIKit

final class HoursWeatherCell: UICollectionViewCell {

    static var reuseId: String = "HoursWeatherCell"

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .equalCentering
        return stack
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    lazy var weatherIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()

        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        tempLabel.text = "1C"
        dateLabel.text = "3"

    }

    func configure(with model: Lists) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hha"
        let hourString = formatter.string(from: model.dt)
        dateLabel.text = hourString
        tempLabel.text = model.main.temp.formatZero()
        weatherIcon.image = UIImage(named: model.weather.first?.icon ?? "")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension HoursWeatherCell {
    func setupConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(weatherIcon)
        stackView.addArrangedSubview(tempLabel)


        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            dateLabel.heightAnchor.constraint(equalToConstant: 12),
            tempLabel.heightAnchor.constraint(equalToConstant: 12),

            weatherIcon.heightAnchor.constraint(equalToConstant: 70),
            weatherIcon.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}

