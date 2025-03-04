//
//  DataService.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 03.03.2025.
//

import Foundation
import CoreData

protocol DataServiceProtocol {
    func fetchWeatherInfo(name: String) async -> CDWeatherInfo?
}

class DataService: DataServiceProtocol {
    
    static let shared = DataService()
    
    private let networkService: NetworkServiceProtocol
    private let coreDataService: CoreDataService
    
    
    init(networkService: NetworkServiceProtocol = NetworkService(), coreDataService: CoreDataService = CoreDataService.shared) {
        self.networkService = networkService
        self.coreDataService = coreDataService
    }
    
    func fetchWeatherInfo(name: String) async -> CDWeatherInfo?{
        // перевіряємо чи є дані в Core Data
        if let catchedData = coreDataService.fetchWeather(by: name) {
            print("Returning cached weather data from Core Data")
            return catchedData
        }
        
        //якщо в базі немає даних - запитуємо API
        print("Fetching weather from API...")
        if let data = try  await networkService.getWeatherFor(cityName: name) {
            //Записуємо дані в CoreDataService
            let result = coreDataService.insertWeather(with: data)
            return result
        } else {
            return nil
        }
    }
}
