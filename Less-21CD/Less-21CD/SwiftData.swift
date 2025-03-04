//

//  Untitled.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 03.03.2025.
//

import Foundation
import SwiftData

@Model
class WeatherInfo {
    
    var id: UUID
    var cityName: String
    var temp: Double
    var humidity: Double
    
    init(id: UUID = UUID(), cityName: String, temp: Double, humidity: Double) {
        self.id = id
        self.cityName = cityName
        self.temp = temp
        self.humidity = humidity
    }
}


class SwiftDataService {
    
    static let shared = SwiftDataService()
    
    private let container: ModelContainer
    private let context: ModelContext
    
    private init() {
        do{
            container = try ModelContainer(for: WeatherInfo.self)
            context = ModelContext(container)
        } catch {
            fatalError("Failed initiate SwiftData: \(error.localizedDescription)")
        }
    }
    
    //додавання новго запису
    func insertWeather(cityName: String, temp: Double, humidity: Double) {
        let newWeather = WeatherInfo(cityName: cityName, temp: temp, humidity: humidity)
        
        context.insert(newWeather)
        saveContext()
    }
    
    //отримання погоди за містом
    func fetchWeather(cityName: String) -> WeatherInfo? {
        let descriptor = FetchDescriptor<WeatherInfo>(predicate: #Predicate {
            $0.cityName == cityName
        })
        
        return try? context.fetch(descriptor).first
    }
    
    //видалення погоди
    func deleteWeather(cityName: String) {
        if let weather = fetchWeather(cityName: cityName) {
            context.delete(weather)
            saveContext()
        }
    }
    
    //збереження
    func saveContext() {
        do {
            try? context.save()
        } catch {
            fatalError("Failed save context: \(error.localizedDescription)")
        }
        
    }
}
