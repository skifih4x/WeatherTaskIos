//
//  UIStackView + Extension.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 23.12.2022.
//

import UIKit

extension UIStackView {
    convenience init(
        _ axis: NSLayoutConstraint.Axis,
        _ alignment: UIStackView.Alignment,
        _ distribution: UIStackView.Distribution) {
            self.init()
            self.axis = axis
            self.alignment = alignment
            self.distribution = distribution
        }
}
