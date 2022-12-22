//
//  UILabel + Extension.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 22.12.2022.
//

import UIKit

extension UILabel {

    convenience init(textMinSize: String) {
        self.init()
        self.text = text
        font = .systemFont(ofSize: 13)
        textColor = .white
    }

    convenience init(_ text: String,_ font: UIFont) {
        self.init()
        self.text = text
        self.font = font
        textColor = .white
    }


    convenience init(textMaxSize: String) {
        self.init()
        self.text = text
        font = .boldSystemFont(ofSize: 28)
        textColor = .white
    }
}

