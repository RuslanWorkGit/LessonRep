//
//  YellowViewModel.swift
//  Less-13
//
//  Created by Ruslan Liulka on 10.02.2025.
//

import Foundation

class YellowViewModel {
    
    //посилання на модель
    private var product: Product? {
        
        //викликається автоматично коли ми оновимо 
        didSet {
            updateProductName?(product?.name ?? "No name")
        }
    }
    
    var updateProductName: ((String) -> Void)?
    
    func fetchProduct() {
        //go to network ...
        //takes some time
        
        let newProduct = Product(name: "Yellow Product")
        //map, convert
        
        self.product = newProduct
    }
    
    
}
