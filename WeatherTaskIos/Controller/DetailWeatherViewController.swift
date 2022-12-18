//
//  DetailWeatherViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 17.12.2022.
//

import UIKit

class DetailWeatherViewController: UIViewController {

    var modelVC: CurrentWeatherModel?

    lazy private var detailViewMain: DetailViewMainWeather = {
        let view = DetailViewMainWeather()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1).cgColor
        view.addSubview(detailViewMain)

        NSLayoutConstraint.activate([
            detailViewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            detailViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        setNavigationController()
    }

    private func setNavigationController() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        navBarAppearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.frame = CGRect(
            x: 0,
            y: 0,
            width: navigationController?.navigationBar.frame.size.width ?? 0,
            height: 116
        )
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnTap = false
        navigationItem.hidesSearchBarWhenScrolling = false

        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.imageView?.tintColor = .white
        button.addTarget(self, action: #selector(callMethod), for: .touchUpInside)
        button.sizeToFit()

        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
    }
    @objc func callMethod(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated:true)
    }
}

import SwiftUI

struct PeopleVCProviderDetail: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
            .previewDevice("iPhone 14 Pro Max")
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
