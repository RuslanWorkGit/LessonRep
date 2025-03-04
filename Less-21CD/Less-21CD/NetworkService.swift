//
//  NetworkService.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 03.03.2025.
//

import Foundation

struct WeatherInfoAPI: Decodable {
    let name: String
}

protocol NetworkServiceProtocol {
    func getWeatherFor(cityName: String) async -> WeatherInfoAPI?
}

enum ConstantLink: String {
    case mainLink = "https://api.openweathermap.org/data/2.5/weather?"
    case city = "q="
    case latitude = "lat="
    case longitude = "lon="
    case appid = "appid=9150ef8248678c9c51a5dfe2d87e208d"
    case metrics = "units=metric"
}

class NetworkService: NetworkServiceProtocol {
    
    func getWeatherFor(cityName: String) async -> WeatherInfoAPI?{
        let linkApi = ConstantLink.mainLink.rawValue + ConstantLink.city.rawValue + "\(cityName)" + "&" + ConstantLink.appid.rawValue + "&" + ConstantLink.metrics.rawValue
        
        var request = URLRequest(url: URL(string: linkApi)!)
        request.httpMethod = "GET"
        
        do {
            
            var responseData: WeatherInfoAPI?
            
           let _ = try await URLSession.shared.dataTask(with: request) { data, response, error in
                
               responseData = WeatherInfoAPI(name: "Sumy")

            }.resume()
            
            return responseData

        }
        
    }
}
