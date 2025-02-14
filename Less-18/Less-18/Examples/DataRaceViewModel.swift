//
//  Untitled.swift
//  Less-18
//
//  Created by Ruslan Liulka on 13.02.2025.
//

import Foundation


class DataRaceViewModel: ObservableObject {
    
    @Published var fileContents: String = ""
    
    private let fileName = "DataRaceExample.txt"
    private let fileManager = FileManager.default
    
    private var counter: Int = 0
    
    init() {
        createFileIfNeeded()
    }
    
    //СТворення файлу якщо його немає
    
    private func createFileIfNeeded() {
        
        let filePath = getFilePath()
        try? fileManager.removeItem(atPath: filePath)
        
        let initialContent = ""
        try? initialContent.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
    
    //отримання шляху до файлу
    private func getFilePath() -> String {
        
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentDirectory.appendingPathComponent(fileName).path
    }
    
    //Функція запису в файл
    func writeToFile() {
        
        counter += 1
        let value = counter
        
        DispatchQueue.global().async { [weak self] in
            guard let self else { return }
            
            let filePath = self.getFilePath()
            let newContent = "\(value): \(Date())\n"
            sleep(1)
            if let currentContent = try? String(contentsOfFile: filePath, encoding: .utf8) {
                let updateContent = currentContent + newContent
                try? updateContent.write(toFile: filePath, atomically: true, encoding: .utf8)
            }
        }
    }
    
    //Функція читання з файлу
    func readFromFile() {
        
        DispatchQueue.global().async { [weak self] in
            guard let self else { return }
            
            let filePath = self.getFilePath()
//            sleep(2)
            if let content = try? String(contentsOfFile: filePath, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.fileContents = content
                }
            }
        }
    }
}
