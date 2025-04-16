//
//  CombineViewModel.swift
//  combine-exmaple
//
//  Created by Ruslan Liulka on 15.04.2025.
//

import Foundation
import Combine

class WeatherService {
    static func fetchWeather(for city: String) -> AnyPublisher<String, Never> {
        Just("Weather in \(city): 20 degree")
            .delay(for: .seconds(1) , scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class CombineViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var serchedText: String = ""
    @Published var writeInfo: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupBinding()
    }
    
    func setupBinding() {
        $serchedText
            .debounce(for: .seconds(2), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard !query.isEmpty else { return }
                self?.fetchWeather(for: query)
            }
            .store(in: &cancellables)
        
        
    }
    
    func fetchWeather(for city: String) {
        WeatherService.fetchWeather(for: city)
            .assign(to: &$writeInfo)
    }
    
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
    
    func useMerge() {
        let pub1 = [1,2,3].publisher
        let pub2 = [4,5,6].publisher
        
        let pub3 = pub1.merge(with: pub2)
        print(pub1)
        print(pub2)
        print(pub3)
    }
    
    func useCombineLatest() {
        let pub1 = CurrentValueSubject<Int, Never>(1)
        let pub2 = CurrentValueSubject<String, Never>("A")
        
        pub1.combineLatest(pub2)
            .sink { print($0)}
        
        pub1
            .sink { number in
                print(number)
            }
        
        pub1.send(2)
        pub2.send("B")
        pub1.combineLatest(pub2)
            .sink { print($0)}
        

    }
    
    func userZip() {
        let pub1 = [1,2,3].publisher
        let pub2 = ["A", "B", "C"].publisher
        
        pub1.zip(pub2)
            .sink { print($0) }
    }
    
    
    func useAssign() {
        
        class MyObject {
            var values: String = "" {
                didSet { print("New value: \(values)")}
            }
        }
        
        let obj = MyObject()
        Just("Hello")
            .assign(to: \.values, on: obj)
    }
    
    func useHandleEvents() {
        Just("Swift")
            .handleEvents(receiveOutput: { print("Output: \($0)")})
            .count()
            .sink(receiveValue: { print("Count: \($0)")})

        
        [1,2,3,4].publisher
            .count()
            .sink(receiveValue: { print("Count: \($0)")})
        
        [1,2,3,4].publisher
            .first(where: { $0 > 2})
            .sink(receiveValue: { print("First value: \($0)")})
        
        [2,4,6].publisher
            .allSatisfy { $0 % 2 == 0}
            .sink { result in
                print(result)
            }
    }
}
