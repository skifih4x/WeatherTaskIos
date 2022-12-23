//
//  SunRiseSetCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit

class SunRiseSetCell: UITableViewCell {

    static let identifier = "SunRiseSetCell"

    private lazy var riseSetStackView = UIStackView(.horizontal, .center, .fillEqually)

    private lazy var sunriseStackView = UIStackView(.vertical, .center, .fillProportionally)

    private lazy var sunriseTextLabel = UILabel("SUNRASE", .systemFont(ofSize: 13))

    private lazy var sunriseLabel = UILabel("7.00am", .boldSystemFont(ofSize: 28))

    private lazy var sunsetStackView = UIStackView(.vertical, .center, .fillProportionally)

    private lazy var sunsetTextLabel = UILabel("SUNSET", .systemFont(ofSize: 13))

    private lazy var sunsetLabel = UILabel("7.00pm", .boldSystemFont(ofSize: 28))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setConstaint()
    }

    private func setLayout() {
        backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        addSubview(riseSetStackView)
        addSubview(sunriseStackView)
        addSubview(sunsetStackView)
        riseSetStackView.translatesAutoresizingMaskIntoConstraints = false
        sunriseStackView.translatesAutoresizingMaskIntoConstraints = false
        sunsetStackView.translatesAutoresizingMaskIntoConstraints = false
        riseSetStackView.addArrangedSubview(sunriseStackView)
        riseSetStackView.addArrangedSubview(sunsetStackView)
        sunriseStackView.addArrangedSubview(sunriseTextLabel)
        sunriseStackView.addArrangedSubview(sunriseLabel)
        sunsetStackView.addArrangedSubview(sunsetTextLabel)
        sunsetStackView.addArrangedSubview(sunsetLabel)
    }

    private func setConstaint() {
        NSLayoutConstraint.activate([
            riseSetStackView.topAnchor.constraint(equalTo: topAnchor),
            riseSetStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            riseSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            riseSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func configure(model: CurrentWeatherModel) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        let sunrise = formatter.string(from: model.sys.sunrise)
        let sunset = formatter.string(from: model.sys.sunset)
        
        sunriseTextLabel.text = "SUNRASE"
        sunriseLabel.text = "\(sunrise)"
        sunsetTextLabel.text = "SUNSET"
        sunsetLabel.text = "\(sunset)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
