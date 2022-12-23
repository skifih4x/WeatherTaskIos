//
//  MainTableViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 14.12.2022.
//

import UIKit

class MainViewController: UIViewController, UISearchBarDelegate {

    private var model: CurrentWeatherModel?

    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MainWeatherCell.self, forCellReuseIdentifier: MainWeatherCell.identifier)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.allowsSelectionDuringEditing = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    //    let city = ["Warsaw","Bucharest","Martuni","Shah Alam","Karmie","Budapest","Munich","Netivot","Santa Cruz de la Sierra","Porto Alegre","Kfar Yona","Palermo","Bremen","Jermuk","Beit Shemesh","Florence","Utrecht","Buenos Aires","Guayaquil","Rosario","Soledad","Subang Jaya","Valencia","Pasir Gudang","Akhtala"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //        let index = mainTableView.indexPathForSelectedRow
        //        guard let indexPath = index else { return }
        view.addSubview(mainTableView)
        networkLayer()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationController()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainTableView.frame = view.bounds
    }

    private func setNavigationController() {
        title = "Weather"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .none
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
    }

    private func networkLayer() {
        NetworkWeather.shared.fetchCurrentWeather() { [weak self] result in
            switch result {
            case .success(let success):
                self?.model = success
                self?.mainTableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

// MARK: - TableView Delegate and DataSourse

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainWeatherCell.identifier, for: indexPath) as? MainWeatherCell else { return UITableViewCell() }
        guard let models = model else { return UITableViewCell() }
        //        cell.configureCity(city: city[indexPath.row])
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
