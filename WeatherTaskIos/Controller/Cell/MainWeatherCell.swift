//
//  MainWeatherCell.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 15.12.2022.
//

import UIKit

class MainWeatherCell: UITableViewCell {

    static let identifier = "MainWeatherCell"

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.contentMode = .scaleAspectFill
        return stack
    }()

    private let countryLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()

    private lazy var imageWeather: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "heart.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.image = image
        imageView.contentMode = .center
        return imageView
    }()

    private lazy var tempLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.backgroundColor = .black
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        backgroundColor = .black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(stackView)
        stackView.addArrangedSubview(countryLabel)
        stackView.addArrangedSubview(imageWeather)
        stackView.addArrangedSubview(tempLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),


            countryLabel.widthAnchor.constraint(equalToConstant: 170),

//            imageWeather.widthAnchor.constraint(equalToConstant: 42),
//            imageWeather.heightAnchor.constraint(equalToConstant: 42)

        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: CurrentWeatherModel) {
        tempLabel.text = "\(model.main.temp)"
        countryLabel.text = model.name
        imageWeather.image = UIImage(named: model.weather.first?.icon ?? "")
    }
}

import SwiftUI

struct PeopleVCProvider1: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = MainViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}

