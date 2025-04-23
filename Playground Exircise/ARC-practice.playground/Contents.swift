import UIKit

class Owner {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Owner \(name) deallocated")
    }
}

class Pet {
    var name: String
    weak var owner: Owner?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Pet \(name) deallocated")
    }
}

func testDeinit() {
    var o: Owner? = Owner(name: "Ruslan")
    var p: Pet? = Pet(name: "Sobachka")
    
    o?.pet = p
    p?.owner = o
    
    o = nil
    p = nil
}

testDeinit()
print("Done")
