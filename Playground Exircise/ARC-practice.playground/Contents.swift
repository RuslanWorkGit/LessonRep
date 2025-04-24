import UIKit

//class Owner {
//    var name: String
//    var pet: Pet?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit {
//        print("Owner \(name) deallocated")
//    }
//}
//
//class Pet {
//    var name: String
//    weak var owner: Owner?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit {
//        print("Pet \(name) deallocated")
//    }
//}
//
//func testDeinit() {
//    var o: Owner? = Owner(name: "Ruslan")
//    var p: Pet? = Pet(name: "Sobachka")
//    
//    o?.pet = p
//    p?.owner = o
//    
//    o = nil
//    p = nil
//}
//
//testDeinit()
//print("Done")


//class Club {
//    var name: String
//    var members: [Member] = []
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    func disBand() {
//        for member in members {
//            member.onTheLeftClub?()
//        }
//        members.removeAll()
//
//    }
//    
//    deinit {
//        print("Club \(name) deallocated")
//    }
//}
//
//class Member {
//    var name: String
//    weak var club: Club?
//    
//    var onTheLeftClub: (() -> Void)?
//    
//    init(name: String) {
//        self.name = name
//    }
//    
//    deinit {
//        print("Member \(name) deallocated")
//    }
//}
//
//print("Start")
//func testClubDeinit() {
//    var club: Club? = Club(name: "NY-Club")
//    
//    var member1: Member = Member(name: "Ruslan")
//    var member2: Member = Member(name: "Yana")
//    
//    club?.members = [member1, member2]
//    member1.club = club
//    member2.club = club
//    
//    member1.onTheLeftClub = {
//        print("Member1 deleted from club")
//    }
//    
//    member2.onTheLeftClub = {
//        print("Member2 deleted from club")
//    }
//    
//    club?.disBand()
//    club = nil
//    
//}
//
//
//testClubDeinit()
//print("End")

//@MainActor
//class DownloadManager {
//    var task: DownloadTask?
//    
//    func startDownload() {
//        let task = DownloadTask()
//        
//        self.task = task
//        
//        Task { [weak self] in
//            guard let self = self else { return }
//            
//            await task.start()
//            print("Comletion handler")
//            
//            self.task = nil
//         }
//    
//    }
//    
//    deinit {
//        print("Download manager deallocated")
//    }
//}
//
//class DownloadTask {
//    func start() async {
//        try? await Task.sleep(for: .seconds(2))
//        print("Download finished")
//    }
//    
//    deinit {
//        print("DownloadTask deallocated")
//    }
//}
//
//print("Start")
//
//@MainActor
//func test() async {
//    var manager: DownloadManager? = DownloadManager()
//    manager?.startDownload()
//    
//    try? await Task.sleep(for: .seconds(3))
//    manager = nil
//}
//
//Task {
//    await test()
//    print("END")
//}


class UserFetcher {
    
    func fetchUser() async -> User {
        try? await Task.sleep(for: .seconds(2))
        
        return User(name: "Rusla")
    }
    
    deinit {
        print("Userfetcher deallocated")
    }
}

struct User {
    let name: String
    

}

@MainActor
class UserViewModel {
    var currentUser: User?
    
    func loadUser() async {
        currentUser = try? await UserFetcher().fetchUser()
        print(currentUser?.name)
        
    }
    
    deinit {
        print("User View Model deallocated")
    }

}

func testViewModel() async {
    var userViewModel: UserViewModel? = UserViewModel()
    
    await userViewModel?.loadUser()
    
    userViewModel = nil
    
}

print("Start")

Task {
    await testViewModel()
    print("End")
}
