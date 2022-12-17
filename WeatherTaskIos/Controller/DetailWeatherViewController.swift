//
//  DetailWeatherViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 17.12.2022.
//

import UIKit

class DetailWeatherViewController: UIViewController {

   var modelVC: CurrentWeatherModel?

    lazy private var tempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 45)
        label.text = "City"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1).cgColor
        view.addSubview(tempLabel)

        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: (self.navigationController?.navigationBar.frame.size.width)!, height: 116)
    }
}

import SwiftUI

struct PeopleVCProviderDetail: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 13 Pro Max")
    }

    struct Container: UIViewControllerRepresentable {

        let tabBarVC = DetailWeatherViewController()

        func makeUIViewController(context: Context) -> some UIViewController {
            tabBarVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
