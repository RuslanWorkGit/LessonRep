//
//  CDProduct+CoreDataProperties.swift
//  CDLesson-21
//
//  Created by Ruslan Liulka on 24.02.2025.
//
//

import Foundation
import CoreData


extension CDProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDProduct> {
        return NSFetchRequest<CDProduct>(entityName: "CDProduct")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var user: CDUser?

}

extension CDProduct : Identifiable {

}
