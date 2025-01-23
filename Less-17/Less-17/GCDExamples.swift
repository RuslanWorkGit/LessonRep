//
//  GCDExzmples.swift
//  Less-17
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import Foundation

class GCDExamples {
    
    func examples() {
        
        DispatchQueue.main.async {//Завжди працює з головною чергою
            //Оголошення коли ми хочемо звернутися до UI інтерфейсу
        }
        
        //Використовується коли хочемо щось зробити фоном і встановити пріорітетність
        DispatchQueue.global(qos: .background).async {
            // Виконання задачі у фоновому потоці
            
            DispatchQueue.main.async {
                //Оновлення UI після виконання задачі(Результат виконати у нашому основному отоці)
            }
        }
        
        //Оголошення послідовної черги, Оголошення з власним ідентифікатором
        let serialQueue = DispatchQueue(label: "com.example.serialQueue")
        
        //Послідовне виконання завдань
        serialQueue.async {
            print("Task 1")
        }
        serialQueue.async {
            print("Task 2")
        }
        serialQueue.async {
            print("Task 3")
        }
        
        //оголошуємо групу
        let group = DispatchGroup()
        
        group.enter()//позначка що ми запускаємо задачу
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
        
        
    }
}
