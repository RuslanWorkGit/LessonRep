//
//  ViewController.swift
//  Less-14
//
//  Created by Ruslan Liulka on 19.01.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loadDataButtonAction(_ sender: Any) {
        //jsonSerialization()
        //decoding()
        loadDevices()
        
    }
    
    func jsonSerialization() {
        let urlString = "https://api.restful-api.dev/objects"
        
        guard let url = URL(string: urlString) else {
            assertionFailure("Unnable to make url from strig \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let responseError = error {
                print("Error: \(responseError)")
                return
            }
            
            if let responseData = data {
                print("REsponse: \(responseData)")
                let stringData = String(data: responseData, encoding: .utf8)
                print(stringData)
                
                
                var products: [Product] = []
                
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: [])
                    print(jsonData)
                    
                    
                    print("Start for cycle")
                    if let jsonDict = jsonData as? [[String: Any]] {

                        for json in jsonDict {
                            let name = json["name"] as? String ?? ""
                            let id = json["id"] as? String ?? "-1"
                            
                            var product = Product(name: name, id: id, details: nil)
                            if let dataValue = json["data"] as? [String: Any] {
                                let capacity = dataValue["capacity"] as? String ?? ""
                                let color = dataValue["color"] as? String ?? ""
                                
                                product.details = ProductDetails(capacity: capacity, color: color)
//                                print("ID: \(id), name: \(name), capacity: \(capacity), color: \(color)")
                            }
                            products.append(product)
                        }
                        
                        print(products)
                    }
                    print("end for cycle")
                    
                } catch(let parserError) {
                    print(parserError)
                }
                
            }
            
            
            
        }
        
        task.resume()
    }
    
    func decoding() {
        let urlString = "https://api.restful-api.dev/objects"
        
        guard let url = URL(string: urlString) else {
            assertionFailure("Unnable to make url from strig \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let responseError = error {
                print("Error: \(responseError)")
                return
            }

            guard let responseData = data else {
                print("Unable to get data")
                return
            }
            
            var responseResult: [Device] = []
            
            do {
                
                responseResult = try JSONDecoder().decode([Device].self, from: responseData)
                
                print(responseResult)
                
            } catch(let parseError) {
                print(parseError)
            }

        }
            
        task.resume()
    }
    
    func loadDevices() {
        
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self else { return }
            
            NetworkService.shared.requestDevices { devices in
                
                DispatchQueue.main.async {
                    print(devices)
                }
            }
        }
        
    }
    
}

//Decodable, Encodable, Codable
//Decodable: Data -> Struct
//Encodable: Struct -> Data
//Codable: поєднує і Codable і Decodable
struct Device: Decodable {
    let id: String
    let name: String
    let details: DeviceDetails?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case details = "data"
    }
    
    
}

struct DeviceDetails: Decodable {
    let capacity: String?
    let capacityGb: Int?
    let price: Double?
    let generation: String?
    let color: String?
    
    enum CodingKeys: String, CodingKey {
        case capacity
        case capacityGb = "capacity GB"
        case price
        case generation
        case color
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.capacity = try container.decodeIfPresent(String.self, forKey: .capacity)
        self.capacityGb = try container.decodeIfPresent(Int.self, forKey: .capacityGb)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.generation = try container.decodeIfPresent(String.self, forKey: .generation)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
    }
}

struct Product {
    let name: String
    let id: String
    var details: ProductDetails?
}

struct ProductDetails {
    let capacity: String
    let color: String
}
