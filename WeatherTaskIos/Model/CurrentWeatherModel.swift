//
//  CurrentWeatherModel.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 15.12.2022.
//

struct CurrentWeatherModel: Codable, Hashable {
    let id: Int
    let name: String
    let weather: [CurrentWeather]
    let main: MainWeather
}

struct CurrentWeather: Codable, Hashable {
    let id: Int
    let icon: String
}

struct MainWeather: Codable, Hashable {
    let temp: Double
}
