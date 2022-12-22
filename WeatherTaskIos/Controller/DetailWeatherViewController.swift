//
//  DetailWeatherViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 17.12.2022.
//

import UIKit

class DetailWeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var modelVC: CurrentWeatherModel?
    var forecastModel: ForecastWeatherModel?

    lazy var contentViewSize = CGSize(width: view.frame.width, height: view.frame.height)

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.frame = view.bounds
        scroll.contentSize = contentViewSize
        return scroll
    }()

    private lazy var detailViewMain: DetailViewMainWeather = {
        let view = DetailViewMainWeather(frame: .zero)
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect(x: 0, y: 230, width: view.frame.width, height: 500), collectionViewLayout: createCompositionalLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collection.backgroundColor = .none
        collection.register(HoursWeatherCell.self, forCellWithReuseIdentifier: HoursWeatherCell.reuseId)
        collection.register(WeekWeatherCell.self, forCellWithReuseIdentifier: WeekWeatherCell.reuseId)
        collection.isScrollEnabled = false
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 620, width: view.frame.width, height: 500), style: .grouped)
        tableView.register(SunRiseSetCell.self, forCellReuseIdentifier: SunRiseSetCell.identifier)
        tableView.register(HumidWindCell.self, forCellReuseIdentifier: HumidWindCell.identifier)
        tableView.register(FeelTempPressurCell.self, forCellReuseIdentifier: FeelTempPressurCell.identifier)
        tableView.allowsSelectionDuringEditing = false
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        setLayout()
        setNavigationController()
        setLayout()
        guard let modelCurrent = modelVC else { return }
        detailViewMain.configure(model: modelCurrent)

        NetworkWeather.shared.fetchForecastWeather(cityID: modelCurrent.id) { result in
            switch result {
            case .success(let success):
                self.forecastModel = success
                self.collectionView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
    }

    private func setLayout() {
        view.layer.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1).cgColor
//        view.addSubview(detailViewMain)
//        view.addSubview(collectionView)
//        view.addSubview(mainTableView)
        view.addSubview(scrollView)
        scrollView.addSubview(detailViewMain)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(mainTableView)


        NSLayoutConstraint.activate([

            detailViewMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            detailViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

//            mainTableView.topAnchor.constraint(equalTo: detailViewMain.topAnchor),
//            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setNavigationController() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1)
        navBarAppearance.shadowColor = .red
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationItem.largeTitleDisplayMode = .never
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = modelVC else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SunRiseSetCell.identifier, for: indexPath) as? SunRiseSetCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HumidWindCell.identifier, for: indexPath) as? HumidWindCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeelTempPressurCell.identifier, for: indexPath) as? FeelTempPressurCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    // MARK: - Setup Layout

    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            var section: NSCollectionLayoutSection?

            switch sectionIndex {
            case 0:  section = self.createHourseSection()
            default: section = self.createWeeksSection()
            }
            return section
        }
        return layout
    }

    func createHourseSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)


        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(120),
                                                     heightDimension: .estimated(104))

        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 0, trailing: 12)

        return layoutSection
    }

    func createWeeksSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 20, bottom: 0, trailing: 20)
        section.interGroupSpacing = -10
        return section
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension DetailWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 13
        default:
            return 7
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoursWeatherCell.reuseId, for: indexPath) as? HoursWeatherCell else { return UICollectionViewCell() }

            let item = forecastModel?.list[indexPath.item]
            guard let items = item else { return cell }
            cell.configure(with: items)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekWeatherCell.reuseId, for: indexPath) as? WeekWeatherCell else { return UICollectionViewCell() }

            let item = forecastModel?.list[indexPath.item]
            guard let items = item else { return cell}
            cell.configure(with: items)
            return cell
        }
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
