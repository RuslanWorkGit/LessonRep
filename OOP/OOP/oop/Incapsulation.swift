//
//  Incapsulation.swift
//  OOP
//
//  Created by Ruslan Liulka on 17.04.2025.
//

import Foundation

class BackAccount {
    
    private var balance: Double = 0.0
    
    func depositn(amount: Double) {
        balance += amount
        print("Deposit: \(amount)")
    }
    
    func showBalance() -> Double {
        return balance
    }
}
