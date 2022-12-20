//
//  ForecastWeatherModel.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 20.12.2022.
//

struct ForecastWeatherModel: Codable {
    let list: [Lists]
}

struct Lists: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let rain: Rain?
}

struct Weather: Codable {
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
}

struct Rain: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}
