//
//  DetailWeatherViewController.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 17.12.2022.
//

import UIKit

class DetailWeatherViewController: UIViewController {

    var modelVC: CurrentWeatherModel?
    var forecastModel: ForecastWeatherModel?

    lazy private var detailViewMain: DetailViewMainWeather = {
        let view = DetailViewMainWeather()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var collectionView: UICollectionView!
//    lazy var collectionView: UICollectionView = {
//        var colection = UICollectionView()
//        colection = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
//        colection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        colection.register(HoursWeatherCell.self, forCellWithReuseIdentifier: HoursWeatherCell.reuseId)
//        colection.register(WeekWeatherCell.self, forCellWithReuseIdentifier: WeekWeatherCell.reuseId)
//        colection.translatesAutoresizingMaskIntoConstraints = false
//        return colection
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: .init(x: 0, y: 300, width: view.frame.width, height: 390), collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .none
        collectionView.register(HoursWeatherCell.self, forCellWithReuseIdentifier: HoursWeatherCell.reuseId)
        collectionView.register(WeekWeatherCell.self, forCellWithReuseIdentifier: WeekWeatherCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        guard let modelCurrent = modelVC else { return }
        detailViewMain.configure(model: modelCurrent)
        view.layer.backgroundColor = UIColor(red: 0.246, green: 0.516, blue: 0.867, alpha: 1).cgColor
        view.addSubview(detailViewMain)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            detailViewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 195),
            detailViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        NetworkWeather.shared.fetchForecastWeather(cityID: modelCurrent.id) { result in
            switch result {
            case .success(let success):
                self.forecastModel = success
                self.collectionView.reloadData()
            case .failure(let failure):
                print(failure)
            }
        }
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


    // MARK: - Setup Layout

    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            var section: NSCollectionLayoutSection?

            switch sectionIndex {
            case 0:  section = self.createWaitingChatSection()
            default: section = self.createActiveChatSection()
            }

            return section
        }

        return layout
    }

    func createWaitingChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)


        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(120),
                                                     heightDimension: .estimated(104))

        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 12, bottom: 0, trailing: 12)

        return layoutSection
    }

    func createActiveChatSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 8, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 20, bottom: 0, trailing: 20)
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
        case 0: return 13
        default: return 7
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
