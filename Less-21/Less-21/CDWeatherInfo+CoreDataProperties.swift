//
//  CDWeatherInfo+CoreDataProperties.swift
//  Less-21
//
//  Created by Ruslan Liulka on 21.02.2025.
//
//

import Foundation
import CoreData


extension CDWeatherInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherInfo> {
        return NSFetchRequest<CDWeatherInfo>(entityName: "CDWeatherInfo")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var temp: Double
    @NSManaged public var humidity: Double

}

extension CDWeatherInfo : Identifiable {

}
