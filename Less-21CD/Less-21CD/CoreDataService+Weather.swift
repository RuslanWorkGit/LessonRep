
//
//  Untitled.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 03.03.2025.
//

import CoreData

extension CoreDataService {
    
    func fetchWeather(by cityName: String) -> CDWeatherInfo? {
        let fetchRequest: NSFetchRequest<CDWeatherInfo> = CDWeatherInfo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", cityName )
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            fatalError("Failed to fetch weather: \(error)")
        }
    }
    
    
    func insertWeather(with data: WeatherInfoAPI) -> CDWeatherInfo {
        
        let newItem = insertEntity(CDWeatherInfo.self)
        newItem.name = data.name
        
        return newItem
    }
}
