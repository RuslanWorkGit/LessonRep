//
//  ContentView.swift
//  Less-17
//
//  Created by Ruslan Liulka on 22.01.2025.
//

import SwiftUI

class MyQueue {
    
    //створення власної черги
    let serialQueue = DispatchQueue(label: "MyQueue", qos: .utility)
    
    let concurentQueue = DispatchQueue(label: "MyQueue", qos: .utility, attributes: .concurrent)
}

struct ContentView: View {
    
    @State private var data: String = "Loading..."
   
    let myQueue = MyQueue()
    
    var body: some View {
        VStack {
            Text(data)
                .onAppear(){ //OnAppear коли елемент показаний на екрані виконуться переданий код
                   // loadData()
                    //loadDifferentQueues()
                    dispatchGroup()
                    
                    myQueue.serialQueue.async {
                        print("🫡")
                    }
                    myQueue.serialQueue.async {
                        print("🇺🇦")
                    }
                    myQueue.serialQueue.async {
                        print("🤝")
                    }
                    
                    myQueue.concurentQueue.async {
                        print("🫡")
                    }
                    myQueue.concurentQueue.async {
                        print("🇺🇦")
                    }
                    myQueue.concurentQueue.async {
                        print("🤝")
                    }
                    
                    
                }
        }
        .padding()
    }
    
    func loadData() {
        
//        DispatchQueue.global(qos: .userInteractive).async {
//            let fetchedData = "Fetched Data"
//            sleep(4)
//            DispatchQueue.main.async {
//                data = fetchedData
//            }
//        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let fetchedData = "Fetched Data"
            sleep(4)
            DispatchQueue.main.async {
                data = fetchedData
            }
        }


    }
    
    
    func loadDifferentQueues () {
        DispatchQueue.global(qos: .userInteractive).async {
            
            var counter = 0
            while counter <= 1000 {
                counter += 1
                print("👌 - userInteractive")
            }


//            let fetchedData = "Fetched Data"
//            sleep(4)
//            DispatchQueue.main.async {
//                
//                data = fetchedData
//            }
            
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
    
            var counter = 0
            while counter <= 1000 {
                counter += 1
                print("🌹 - userInitiated")
            }
        }
        
        DispatchQueue.global(qos: .utility).async {
        
            var counter = 0
            while counter <= 1000 {
                counter += 1
                print("🔥 - utility")
            }
        }
        
        DispatchQueue.global(qos: .background).async {
        
            var counter = 0
            while counter <= 1000 {
                counter += 1
                print("📚 - background")
            }
        }
    }
    
    func dispatchGroup() {
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async {
            print("Task 1")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global().async {
            print("Task 2")
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("All task completed")
        }
        
        let imageGroup = DispatchGroup()
        
        let imagesUrl: [URL] = [/*10 url*/]
        
        var images: [URL: Data] = [:]//треба використовувати словник для збереження послідовності данних, щоб відповіднна url відповідала відповідній картинці(можна використовувати індекс [Int: Data])
        
        for (index, url) in imagesUrl.enumerated() {
            imageGroup.enter()
            DispatchQueue.global().async {
                let imageData = Data()
                
                DispatchQueue.main.async { //Бажано використовувати фоно послідовну чергу
                    images[url] = imageData
                }
                imageGroup.leave()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
