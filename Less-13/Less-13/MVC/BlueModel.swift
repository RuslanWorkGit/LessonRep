//
//  BlueModel.swift
//  Less-13
//
//  Created by Ruslan Liulka on 06.02.2025.
//

import Foundation

protocol BlueModelDelegate: AnyObject {
    
    func didLoadData(text: String, success: Bool)
}

class BlueModel {
    
    weak var delegate: BlueModelDelegate?
    
    func loadData() {
        //тут може бути довга операція з чергами
        delegate?.didLoadData(text: "Hello", success: true)
    }
}
