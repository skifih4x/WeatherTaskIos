//
//  HeaderView.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 16.12.2022.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView, UISearchControllerDelegate, UISearchBarDelegate {

    static let identifier = "HeaderView"

    private lazy var labelText: UILabel = {
        var label = UILabel()
        label.text = "Weather"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 34)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()

     lazy var searchBarWeather: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = true
        search.searchBar.barTintColor = .black
        search.searchBar.searchTextField.leftView?.tintColor = .lightGray
        search.searchBar.showsCancelButton = false
        search.searchBar.searchTextField.textColor = .white
        search.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        search.searchBar.searchTextField.backgroundColor = .systemFill
        search.searchBar.delegate = self
//         search.searchBar.sizeToFit()
        return search
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(labelText)
        contentView.addSubview(searchBarWeather.searchBar)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        labelText.bottomAnchor.constraint(equalTo: searchBarWeather.searchBar.topAnchor).isActive = true

        searchBarWeather.searchBar.frame = CGRect(x: 0, y: 94, width: searchBarWeather.searchBar.frame.width, height: searchBarWeather.searchBar.frame.height)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

struct PeopleVCProvider2: PreviewProvider {
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
