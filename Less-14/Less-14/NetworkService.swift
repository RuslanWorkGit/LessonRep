//
//  NetworkService.swift
//  Less-14
//
//  Created by Ruslan Liulka on 20.01.2025.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {
        
    }
    
    func perfomeRequest<T: Decodable>(requestUrl: URLRequest, responseType: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let error = error {
                assertionFailure("Error \(error)")
                return
            }
            
            guard let responseData = data else {
                assertionFailure("Some error")
                completion(.failure(NSError(domain: "NoDataError", code: -1, userInfo: nil)))
                return
            }
            
            do {
                
                let decodedResponse = try JSONDecoder().decode([T].self, from: responseData)
                completion(.success(decodedResponse))
                
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


