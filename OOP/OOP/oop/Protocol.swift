//
//  Protocol.swift
//  OOP
//
//  Created by Ruslan Liulka on 17.04.2025.
//

import Foundation

protocol Transport {
    func start()
    func stop()
}

class Bicekle: Transport {
    func start() {
        print("Bike start")
    }
    
    func stop() {
        print("Bike stop")
    }
    
    
}
