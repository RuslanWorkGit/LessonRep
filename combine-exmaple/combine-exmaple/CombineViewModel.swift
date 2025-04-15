//
//  CombineViewModel.swift
//  combine-exmaple
//
//  Created by Ruslan Liulka on 15.04.2025.
//

import Foundation
import Combine

class CombineViewModel: ObservableObject {
    @Published var text: String = ""
    
    func loadData() {
        Just("Hello")
            .map { $0 + "world!" }
            .assign(to: &$text)
        
        
    }
    
    func tryMapCheck() {
        Just("123")
            .tryMap { string in
                guard let number = Int(string) else { throw URLError(.badURL)}
                return number
            }
            
    }
    
    func upperCaseText() {
        Just("Swift")
            .flatMap { text in
                Just(text.uppercased())
            }
            .assign(to: &$text)
    }
}
