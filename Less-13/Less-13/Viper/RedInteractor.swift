//
//  RedInteractor.swift
//  Less-13
//
//  Created by Ruslan Liulka on 12.02.2025.
//

import Foundation

protocol RedInteractorOutput: AnyObject {
    func dataDidLoad(data: UserData)
}

protocol RedInteractorInput: AnyObject {
    func loadData()
}

class RedInteractor {
    
    weak var output: RedInteractorOutput?
    

    
}

extension RedInteractor: RedInteractorInput {
    func loadData() {
        output?.dataDidLoad(data: UserData())
    }
    
    
}
