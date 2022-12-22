//
//  CurrentWeatherModel.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 15.12.2022.
//

struct CurrentWeatherModel: Codable {
    let id: Int
    let name: String
    let weather: [CurrentWeather]
    let main: MainWeather
    let wind: Wind
    let sys: SunRiseSet
}

struct CurrentWeather: Codable {
    let id: Int
    let icon: String
    let description: String
}

struct MainWeather: Codable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
    let feels_like: Double
    let humidity: Int
    let pressure: Int
}

struct Wind: Codable {
    let speed: Double
}

struct SunRiseSet: Codable {
    let sunrise: Int
    let sunset: Int
}
