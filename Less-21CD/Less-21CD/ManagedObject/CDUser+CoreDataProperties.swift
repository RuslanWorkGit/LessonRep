//
//  CDUser+CoreDataProperties.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 21.02.2025.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var products: NSSet?

}

// MARK: Generated accessors for products
extension CDUser {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: CDProduct)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: CDProduct)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

extension CDUser : Identifiable {

}
