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
        label.font = UIFont.systemFont(ofSize: 96)
        label.text = "7"
        label.textColor = .white
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

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navBarAppearance.shadowColor = .clear
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        let button = UIButton(type: .custom)

        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.imageView?.tintColor = .black
        button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.sizeToFit()


        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton

        navigationController?.navigationBar.barTintColor = .white

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnTap = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    @objc func callMethod(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated:true)
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
