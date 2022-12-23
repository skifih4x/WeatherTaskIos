//
//  ForecastWeatherModel.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 20.12.2022.
//

import Foundation

struct ForecastWeatherModel: Decodable {
    let list: [Lists]
}

struct Lists: Decodable {
    let dt: Date
    let main: Main
    let weather: [Weather]
    let rain: Rain?
    let dt_txt: String
}

struct Weather: Decodable {
    let icon: String
}

struct Main: Decodable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
}

struct Rain: Decodable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
