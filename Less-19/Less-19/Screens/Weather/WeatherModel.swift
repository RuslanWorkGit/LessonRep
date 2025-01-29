//
//  WeatherModel.swift
//  Less-19
//
//  Created by Ruslan Liulka on 29.01.2025.
//

struct WeatherModel: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
    }

    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}


