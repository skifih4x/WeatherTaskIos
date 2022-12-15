//
//  NetworkWeather.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 15.12.2022.
//

import Foundation

struct NetworkWeather {

    static let shared = NetworkWeather()

    func fetchCurrentWeather(urlString: String, copletion: @escaping (Result<CurrentWeatherModel, Error>) -> Void ) {

    }
}
