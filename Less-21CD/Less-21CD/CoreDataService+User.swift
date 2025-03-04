//
//  CoreDataService+User.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 23.02.2025.
//

import Foundation
import CoreData

extension CoreDataService {
    
    //Generic
    func insertEntity<T: NSManagedObject>(_ entityType: T.Type/*, configure: (T) -> ()*/) -> T{
        let entity = T(context: context)
//        configure(entity)
//        save(context: context)
        return entity
    }
    
    func deleteEntityGeneric<T: NSManagedObject>(_ entityType: T.Type, predicate: NSPredicate?) {
        let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entityType))
        fetchRequest.predicate = predicate
        
        do {
            let result = try context.fetch(fetchRequest)
            for object in result {
                context.delete(object)
            }
            
            save(context: context)
        } catch {
            print("Failed to delete: \(T.self): \(error.localizedDescription)")
        }
    }
    

    
    func createNewUser(name: String, age: Int16) -> CDUser? {

        //щоб створити нового користувача потрібно NSEntityDescription(є більш нові підходи)(у CDUser є зарезервовані функції такі як addToProducts), NSEntityDescription використовує назву entity в рамках якогось контексту
        let userEntity = NSEntityDescription.entity(forEntityName: "CDUser", in: context)!
        
        // використовуючи опис (а саме з CDUser(імʼя, id і тд)) і зробить insertInto(зробить інстанс і помістить в якийсь контекст)
        let userManagedObjectModel = NSManagedObject(entity: userEntity, insertInto: context)
        
        //заповнюються дані
        userManagedObjectModel.setValue(name, forKey: "name")
        userManagedObjectModel.setValue(age, forKey: "age")
        
        do {
            //робиться збереження після того як були зробені зміни
            try context.save()
        } catch let error {
            assertionFailure()
            debugPrint(error.localizedDescription)
        }
        
        return userManagedObjectModel as? CDUser
    }
    
    //MARK: - Insert Entity
    func insertUser(name: String) -> CDUser {
//        let user = CDUser(context: context)
//        user.name = name

        let user = insertEntity(CDUser.self)
        
//        save(context: context)
        
        return user
    }
    
    //MARK: - update entity
    func updateUser(name: String) {
        
        //Формуємо FetchRequest привʼязаний до відповідної entity
        let fetchRequest: NSFetchRequest<CDUser> = CDUser.fetchRequest()
        // робимо пошук чи є елемент по name(краще робити через id), predicate - клас який формує певну стрінгу з певними правилами, якщо не вкажемо предікат то поверниться масив усіх юзерів, а якщо хочемо пошукати за якимось певним параметром ми маємо записати у fetch певний prediccate, тобто параметри за яким ми хочемо шукати
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            //повертає set(повертає в різній послідовності)
            let result = try context.fetch(fetchRequest)
            
            //якщо обʼєкт є заміняємо йому властивості
            if let userToUpdate = result.first {
                userToUpdate.name = name
                save(context: context)
            } else {
                print("User not found: \(name)")
            }
        } catch {
            print("Failed to update user: \(error.localizedDescription)")
        }
    }
    
    //Пошук
    func fetchUser(name: String) -> CDUser? {
        
        let fetchRequest: NSFetchRequest<CDUser> = CDUser.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        
        do {
            let result = try context.fetch(fetchRequest)
            
            if let userToFind = result.first {
                return userToFind
            } else {
                print("User not found: \(name)")
            }
        } catch {
            print("Faild find user: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    //MARK: - Delete Entity
    func deleteUser(name: String) {
        
        //1 method
//        let fetchRequest: NSFetchRequest<CDUser> = CDUser.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
//        do {
//            let result = try context.fetch(fetchRequest)
//            if let userToDelete = result.first {
//                context.delete(userToDelete)
//                save(context: context)
//            } else {
//                print("User not found: \(name)")
//            }
//        } catch {
//            print("Faild to delete user: \(error.localizedDescription)")
//        }
        
        //2 method
        guard let fethedUser = fetchUser(name: name) else { return }
        context.delete(fethedUser)
        save(context: context)
    }
    
    func getUser(with name: String) -> CDUser {
        
        if let fetchedUser = fetchUser(name: name) {
            return fetchedUser
        } else {
            return insertUser(name: name)
        }
    }
    
    //MARK: - Fetch All
    
    func fetchAll() -> [CDUser] {
        let fetchRequest: NSFetchRequest<CDUser> = CDUser.fetchRequest()
        //пошук лиже джонів
        fetchRequest.predicate = NSPredicate(format: "name == %@", "John")
        //сортування за імʼям і за віком
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true),
            NSSortDescriptor(key: "age", ascending: true)
        ]
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetch: \(error.localizedDescription)")
            return []
        }
    }

}




