//
//  AsyncAwait.swift
//  Less-17
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import Foundation

actor DataFetch {
    
    private var cachedData: String?
    
    func fetchData() async throws -> String {
        
        if let cachedData = cachedData {
            return cachedData
        }
        
//        Task{ // аналог DispatchQueue.global().async
//            
//        }
        print("Fetching data from server...")
        
        try await Task.sleep(nanoseconds: 2_000_000_000)
        let fetchedData = "Fetched data"
        self.cachedData = fetchedData
        
        return fetchedData
    }
}
