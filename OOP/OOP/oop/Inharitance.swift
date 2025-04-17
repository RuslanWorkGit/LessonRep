//
//  Inharitance.swift
//  OOP
//
//  Created by Ruslan Liulka on 17.04.2025.
//

import Foundation

class ElectricCar: Car {
    
    var battaryCapacity: Int
    
    init(battaryCapacity: Int, brand: String, model: String) {
        self.battaryCapacity = battaryCapacity
        super.init(brand: brand, model: model)
    }
}
