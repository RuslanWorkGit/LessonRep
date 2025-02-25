//
//  ViewController.swift
//  Less-21CD
//
//  Created by Ruslan Liulka on 21.02.2025.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addUser(_ sender: Any) {
        
        if let createdUser = CoreDataService.shared.createNewUser(name: "Bob", age: 22) {
            createdUser.id = UUID()
        }
    }
    
    @IBAction func getUsers(_ sender: Any) {
        let result = CoreDataService.shared.fetchDataFromEntity(CDUser.self, fetchRequest: CDUser.fetchRequest())
        
        print(result)
        
        //Видалення усіх User
        CoreDataService.shared.deleteRecords(CDUser.self, fetchRequest: CDUser.fetchRequest())
    }
    
   
}

