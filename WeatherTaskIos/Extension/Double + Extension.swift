//
//  Double + Extension.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 23.12.2022.
//

import Foundation

extension Double {
    
    func formatZero() -> String {
        return String(format: "%.0f", self)
    }

    func formatOne() -> String {
        return String(format: "%.1f", self)
    }
}

extension Int {

    func formatZero() -> String {
        return String(format: "%.0f", self)
    }

    func formatOne() -> String {
        return String(format: "%.1f", self)
    }
}
