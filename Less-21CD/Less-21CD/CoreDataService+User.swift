//
//  CoreDataService+User.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 23.02.2025.
//

import Foundation
import CoreData

extension CoreDataService {
    
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
    

}
