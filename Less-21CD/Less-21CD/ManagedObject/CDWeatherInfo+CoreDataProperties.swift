//
//  CDWeatherInfo+CoreDataProperties.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 03.03.2025.
//
//

import Foundation
import CoreData


extension CDWeatherInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherInfo> {
        return NSFetchRequest<CDWeatherInfo>(entityName: "CDWeatherInfo")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var temp: Double

}

extension CDWeatherInfo : Identifiable {

}
