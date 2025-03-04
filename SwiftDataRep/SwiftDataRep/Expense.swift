//
//  Expense.swift
//  SwiftDataRep
//
//  Created by Ruslan Liulka on 04.03.2025.
//

import Foundation
import SwiftData

@Model
class Expense {
    
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
