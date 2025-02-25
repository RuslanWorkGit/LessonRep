//
//  CDUser+CoreDataProperties.swift
//  CDLesson-21
//
//  Created by Ruslan Liulka on 24.02.2025.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var age: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var product: CDProduct?

}

extension CDUser : Identifiable {

}
