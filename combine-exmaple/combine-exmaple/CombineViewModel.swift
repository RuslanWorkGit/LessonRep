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
    
    func useSwitchToLatest() {
        let publisher = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
        publisher.switchToLatest()
    }
    
    func useReplaceNil() {
        Just(nil as String?) // тут може бути якась змінна
            .replaceNil(with: "Defaults")
            .assign(to: &$text)
    }
    
    func useCatch() {
        Fail(outputType: Int.self , failure: URLError(.badServerResponse))
            .catch { _ in
                Just(0)
            }
    }
    
    func useRetry() {
        Fail(outputType: Int.self, failure: URLError(.badServerResponse))
            .retry(3)
    }
    
    func useDebounce() {
        Just("Hello")
            
            .delay(for: .seconds(2) , scheduler: DispatchQueue.main)
            .map { $0 + " world!" }
            .assign(to: &$text)

    }
    
    func useDifferentFilterOpertators() {
        let array = [1, 2, 3, 4, 5, 5, 5, 6, 5, 7, 1]
        
        array.publisher
            .filter { $0 % 2 == 0}
            .collect()
            .sink { result in
                print(result)
            }
            //.store(in: &<#T##RangeReplaceableCollection#>)
        array.publisher
            .removeDuplicates()
            .collect()
            .sink { result in
                print(result)
            }
        
        let set = Set(array)
        print(set)
        
        
    }
    
}
