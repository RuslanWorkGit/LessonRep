//
//  CDProduct+CoreDataProperties.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 21.02.2025.
//
//

import Foundation
import CoreData


extension CDProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDProduct> {
        return NSFetchRequest<CDProduct>(entityName: "CDProduct")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var price: Double
    @NSManaged public var name: String?
    @NSManaged public var user: CDUser?

}

extension CDProduct : Identifiable {

}
