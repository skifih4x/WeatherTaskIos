//
//  CurrentWeatherModel.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 15.12.2022.
//
import Foundation

struct CurrentWeatherModel: Decodable {
    let id: Int
    let name: String
    let weather: [CurrentWeather]
    let main: MainWeather
    let wind: Wind
    let sys: SunRiseSet
}

struct CurrentWeather: Decodable {
    let id: Int
    let icon: String
    let description: String
}

struct MainWeather: Decodable {
    let temp: Double
    let temp_max: Double
    let temp_min: Double
    let feels_like: Double
    let humidity: Int
    let pressure: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct SunRiseSet: Decodable {
    let sunrise: Date
    let sunset: Date
}
