//
//  NetworkWeather.swift
//  WeatherTaskIos
//
//  Created by Артем Орлов on 15.12.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

struct NetworkWeather {

    static let shared = NetworkWeather()

    func fetchCurrentWeather(urlString: String, copletion: @escaping (Result<CurrentWeatherModel, NetworkError>) -> Void ) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                copletion(.failure(.invalidUrl))
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let result = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                DispatchQueue.main.async {
                    copletion(.success(result))
                }
            } catch  let error {
                print(String(describing: error))
            }
        }.resume()

    }

    func fetchForecastWeather(cityID: Int, completion: @escaping (Result<ForecastWeatherModel, NetworkError>) -> Void ) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&units=metric&appid=22dc65ed9ccb1fee97feb45f8a252e82") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.invalidUrl))
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let result = try JSONDecoder().decode(ForecastWeatherModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } catch  let error {
                print(String(describing: error))
            }
        }.resume()
    }
}
