//
//  SunRiseSetCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit

class SunRiseSetCell: UITableViewCell {

    static let identifier = "SunRiseSetCell"

    private lazy var riseSetStackView: UIStackView = { //Добавляю sunrise и sunset
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var sunriseStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var sunriseTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.text = "SUNRASE"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "7.05"
        label.textColor = .white
        return label
    }()

    private lazy var sunsetStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var sunsetTextLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SUNSET"
        return label
    }()

    private lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10.0"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        addSubview(riseSetStackView)
        addSubview(sunriseStackView)
        addSubview(sunsetStackView)
        riseSetStackView.addArrangedSubview(sunriseStackView)
        riseSetStackView.addArrangedSubview(sunsetStackView)
        sunriseStackView.addArrangedSubview(sunriseTextLabel)
        sunriseStackView.addArrangedSubview(sunriseLabel)
        sunsetStackView.addArrangedSubview(sunsetTextLabel)
        sunsetStackView.addArrangedSubview(sunsetLabel)

        NSLayoutConstraint.activate([
            riseSetStackView.topAnchor.constraint(equalTo: topAnchor),
            riseSetStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            riseSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            riseSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    func configure(model: SunRiseSet) {
        sunriseTextLabel.text = "SUNRASE"
        sunriseLabel.text = "\(model.sunrise)"
        sunsetTextLabel.text = "SUNSET"
        sunsetLabel.text = "\(model.sunset)°"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
