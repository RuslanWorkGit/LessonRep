//
//  ViewModel.swift
//  Less-17
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import Foundation


@MainActor
class ViewModel: ObservableObject {
    
    @Published var data: String = "Loading..."
    @Published var errorMessage: String?
    
    private let dataFetcher = DataFetch()
    
    
    func loadData() async {
        do {
            let fetchedData = try await dataFetcher.fetchData()
            self.data = fetchedData   //Оновлення UI
            
        } catch {
            self.errorMessage = "Failed to fetch data"
        }
    }
}
