//
//  SwiftDataRepApp.swift
//  SwiftDataRep
//
//  Created by Ruslan Liulka on 04.03.2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataRepApp: App {
    
//    let container: ModelContainer = {
//        let schema = Schema([Expense.self])
//        let container = try! ModelContainer(for: schema, configurations: [])
//        return container
//    }() //Створення контейнеру якщо потрібно кастимізація
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //.modelContainer(container)
        .modelContainer(for: Expense.self) //Може передаватися масив, і бути мільше моделей за необхідності
        
    }
}
