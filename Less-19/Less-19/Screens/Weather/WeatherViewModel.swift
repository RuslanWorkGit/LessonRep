//
//  WeatherViewModel.swift
//  Less-19
//
//  Created by Ruslan Liulka on 29.01.2025.
//
import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    @Published var cityName: String = ""
    @Published var temperuture: String = "--"
    @Published var weatherDescription: String = "Loading..."
    
    private let apiKey = "9150ef8248678c9c51a5dfe2d87e208d"

    
    func fetchWeather(by cityName: String) async {
        
        
        guard let url = URL(string: (APIConstants.baseUrl + APIConstants.dataPath + APIConstants.apiVersion + APIConstants.weatherPath + "?") + "q=\(cityName)&appid=\(APIConstants.apiKey)&units=metric") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url )
            guard let httpResponse = response as? HTTPURLResponse, (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) else {
                print("Invalid URL")
                return
            }
            
            //print(String(data: data, encoding: .utf8))
            let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
            updateUI(with: weather)
        } catch {
            print("Error detching weather: \(error)")
        }
    }
    
    
    func fetchWeather(by latitude: Double, by longitude: Double) async {
        
        guard let url = URL(string: (APIConstants.baseUrl + APIConstants.dataPath + APIConstants.apiVersion + APIConstants.weatherPath + "?") + "lat=\(latitude)&lon=\(longitude)&appid=\(APIConstants.apiKey)&units=metric") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url )
            guard let httpResponse = response as? HTTPURLResponse, (httpResponse.statusCode >= 200 && httpResponse.statusCode < 300) else {
                print("Invalid URL")
                return
            }
            
            //print(String(data: data, encoding: .utf8))
            let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
            updateUI(with: weather)
        } catch {
            print("Error detching weather: \(error)")
        }
    }
    
    private func updateUI(with weather: WeatherModel) {
        cityName = weather.name
        temperuture = "\(weather.main.temp) C"
        weatherDescription = weather.weather.first?.description.capitalized ?? "N/A"
    }
}
