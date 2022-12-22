//
//  InfoWeatherView.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 21.12.2022.
//

import UIKit

class InfoWeatherView: UIView, UITableViewDataSource, UITableViewDelegate {

    var detailVC = DetailWeatherViewController()

    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(HumidWindCell.self, forCellReuseIdentifier: HumidWindCell.identifier)
        tableView.allowsSelectionDuringEditing = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainTableView)
        backgroundColor = .red
        print("asdasdasdadadsad\(detailVC.modelVC)")
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HumidWindCell.identifier, for: indexPath) as? HumidWindCell else { return UITableViewCell() }
        guard let detail = detailVC.modelVC else { return cell}
//        cell.configure(model: detail)
        return cell
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
