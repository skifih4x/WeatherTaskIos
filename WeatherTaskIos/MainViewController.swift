//
//  MainTableViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 14.12.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   private var model: CurrentWeatherModel?

    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MainWeatherCell.self, forCellReuseIdentifier: MainWeatherCell.identifier)
        tableView.backgroundColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(mainTableView)

        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.backgroundColor = .black
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        NetworkWeather.shared.fetchCurrentWeather(urlString: "https://api.openweathermap.org/data/2.5/weather?q=bobruisk&units=metric&appid=22dc65ed9ccb1fee97feb45f8a252e82") { result in
            switch result {
            case .success(let success):
                self.model = success
                self.mainTableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         model?.name.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: MainWeatherCell.identifier, for: indexPath) as? MainWeatherCell else { return UITableViewCell() }
         guard let models = model else { return UITableViewCell() }
         cell.configure(model: models)
        cell.backgroundColor = .black
        return cell
    }
}

import SwiftUI

struct PeopleVCProvider: PreviewProvider {
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



