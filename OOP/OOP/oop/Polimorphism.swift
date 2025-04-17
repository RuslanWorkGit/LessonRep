//
//  Polimorphism.swift
//  OOP
//
//  Created by Ruslan Liulka on 17.04.2025.
//

import Foundation

class Animal {
    func makeSount() {
        print("Make some sound")
    }
 }

class Dog: Animal {
    override func makeSount() {
        print("Woof")
    }
}

class Cat: Animal {
    override func makeSount() {
        print("Meow!")
    }
}
