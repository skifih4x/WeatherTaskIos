//
//  MainTableViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 14.12.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    let sectionTitle = [""]

    let city = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]

   private var model: CurrentWeatherModel?

    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MainWeatherCell.self, forCellReuseIdentifier: MainWeatherCell.identifier)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.allowsSelectionDuringEditing = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainTableView)

        title = "Weather"
        mainTableView.backgroundColor = .black


        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .black
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic


            NetworkWeather.shared.fetchCurrentWeather(urlString: "https://api.openweathermap.org/data/2.5/weather?q=warsaw&units=metric&appid=22dc65ed9ccb1fee97feb45f8a252e82") { result in
                switch result {
                case .success(let success):
                    self.model = success
                    self.mainTableView.reloadData()
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainTableView.frame = view.bounds
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitle.count
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         model?.weather.count ?? 1
         1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: MainWeatherCell.identifier, for: indexPath) as? MainWeatherCell else { return UITableViewCell() }
         guard let models = model else { return UITableViewCell() }
         cell.configure(model: models)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let vc = DetailWeatherViewController()
        vc.modelVC = model
        navigationController?.pushViewController(vc, animated: true)
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
