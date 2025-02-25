//
//  CDNew+CoreDataProperties.swift
//  CDLesson-21
//
//  Created by Ruslan Liulka on 24.02.2025.
//
//

import Foundation
import CoreData


extension CDNew {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDNew> {
        return NSFetchRequest<CDNew>(entityName: "CDNew")
    }

    @NSManaged public var name: String?

}

extension CDNew : Identifiable {

}
