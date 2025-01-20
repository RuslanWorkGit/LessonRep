//
//  NetworkService+Devices.swift
//  Less-14
//
//  Created by Ruslan Liulka on 20.01.2025.
//
import Foundation


extension NetworkService {
    
    func requestDevices(completion: (([Device]) -> ())?) {
        let urlString = "https://api.restful-api.dev/objects"
        
        guard let url = URL(string: urlString) else {
            assertionFailure("no url \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        perfomeRequest(requestUrl: request, responseType: Device.self) { result in
            
            switch result {
            case .success(let devices):
                completion?(devices)
            case .failure:
                break
            }
        }
    }
}
