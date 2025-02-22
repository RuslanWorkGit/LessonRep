//
//  CoreDataService.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 21.02.2025.
//

import CoreData

class CoreDataService: NSObject {
    
    //singleton
    static let shared = CoreDataService()
    
    var objectStoreFileName: String
    
    init(baseFileName: String = "MyStorage") {
        self.objectStoreFileName = baseFileName
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        guard let mom = NSManagedObjectModel.mergedModel(from: [Bundle.main]) else {
            fatalError("Could not get Managed Object Model")
        }
        
        //Ініціалізується контейнер з нашою моделью(створюємо інстанс контейнера)
        let container = NSPersistentContainer(name: objectStoreFileName, managedObjectModel: mom)
        
        //завантажуємо дані
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("This error data storage from being initialized: \(error). \(error.userInfo)")
            }
        })
        
        //встановлюються певні властивостя для context
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
    
    // ці 4 контексти це різні оперативні памʼяті, і коли ми створюємо якийсь обʼєкт з якоюсь моделькою, ми робим інстанс якої наприклад (CDUser, CDProduct), наприклад CDUser створимо в рамках context це означає усі зміни які ми будемо робити будуть триматися в рамках цього контексту, якщо ми захочимо підтягнути дані в іншому контексті наприклад backgroundContext то це буде 2 різні інстанси по суті 2 різні оперативні памʼяті(2 різні записи для користувача), те що будемо змінювати в context ніяк не буде змінюватися в backgroundContext. 
    
    lazy var context: NSManagedObjectContext = {
        let taskContext = self.persistentContainer.viewContext
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }()
    
    lazy var backgroundContext: NSManagedObjectContext = {
        let taskContext = self.persistentContainer.newBackgroundContext()
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }()
    
    lazy var pivateContext: NSManagedObjectContext = {
        let privateChildContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateChildContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
        return privateChildContext
    }()
}
