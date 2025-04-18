//
//  Solid.swift
//  OOP
//
//  Created by Ruslan Liulka on 17.04.2025.
//

import Foundation

//S - Single responsibility

//Wrong
class UserManager {
    func saveUserToDataBase(user: String) {
        print("Save user: \(user)")
    }
    
    func sendEmailToUser(user: String) {
        print("email send to \(user)")
    }
}

//Wright
class UserSaver {
    func saveUserToDataBase(user: String) {
        print("Save user: \(user)")
    }
}

class EmailSender {
    func sendEmailToUser(user: String) {
        print("email send to \(user)")
    }

}

let userSaver = UserSaver()
let emailSender = EmailSender()

//O - Open Close Principle

//Wrong
class Payment {
    func processPayment(method: String) {
        if method == "CreditCard" {
            print("Credit card methor")
        } else if method == "PayPal" {
            print("Pay Pal method")
        }
    }
}

protocol PaymentMethod {
    func procesPayment()
}

class CreditCard: PaymentMethod {
    func procesPayment() {
        print("Credit card methor")
    }
}

class PayPal: PaymentMethod {
    func procesPayment() {
        print("Pay Pal method")
    }
}

class PaymentProcessor {
    func process(paymentMethod: PaymentMethod) {
        paymentMethod.procesPayment()
    }
}

let paymentProcessor = PaymentProcessor()
//paymentProcessor.process(paymentMethod: CreditCard())


// L - Liskov substitution principle

//Worng
//class Bird {
//    func fly() {
//        print("Flying")
//    }
//}
//class Penguin: Bird {
//    override func fly() {
//        fatalError("Penguin cant fly")
//    }
//}

//Wright

protocol Bird {
    
}

protocol FlyableBird: Bird {
    func fly()
}

class sparrow: FlyableBird {
    func fly() {
        print("Sparrow Fly")
    }
}

class Penguin: Bird {
    
    
}

// I - Interface Segregation

//Wrong

//protocol Worker {
//    func work()
//    func eat()
//}
//
//class Develloper: Worker {
//    func work() {
//        print("Write code")
//    }
//    
//    func eat() {
//        print("Eat meal")
//    }
//}
//
//class Robot: Worker {
//    func work() {
//        print("Working 24/7")
//    }
//    
//    func eat() {
//        fatalError("Robots don't eat")
//    }
//}

protocol Workable {
    func work()
}

protocol Eatable {
    func eat()
}

class Developer: Workable, Eatable {
    func work() {
        print("Write code")
    }
    
    func eat() {
        print("Eat meal")
    }
}

class Robot: Workable {
    func work() {
        print("Working 24/7")
    }
}

//D - Dependency Inversion

//Wrong
//class FileLogger {
//    func log(msg: String) {
//        print("Logging to file: \(msg)")
//    }
//}
//
//class Application {
//    private let logger = FileLogger()
//    
//    func performAction() {
//        logger.log(msg: "Action performed!")
//    }
//}

// Wright
protocol Logger {
    func log(msg: String)
}

class FileLogger: Logger {
    func log(msg: String) {
        print("Logging to file: \(msg)")
    }
}

class ConsoleLogger: Logger {
    func log(msg: String) {
        print("Logging to console: \(msg)")
    }
}

class Application {
    private let logger: Logger
    
    init(logger: Logger) {
        self.logger = logger
    }
    
    func performeAction() {
        logger.log(msg: "action performed.")
    }
}
