import UIKit

class UserFetcher {
    
    func fetchUser() async throws -> User {
        try? await Task.sleep(for: .seconds(2))
        try Task.checkCancellation()
        return User(name: "Ruslan")
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
    var currentTask: Task<Void, Never>?
    
    func loadUser() {
        currentTask?.cancel()
        
        currentTask = Task { [weak self] in
            do {
                guard let self = self else { return }
                let user = try await UserFetcher().fetchUser()
                self.currentUser = user
                print(user.name)
            } catch {
                print("Task was cancelled: \(error)")
            }
            
        }
        
    }
    
    func cancelLoading() {
        currentTask?.cancel()
    }
    
    deinit {
        print("User View Model deallocated")
    }

}

@MainActor
func testViewModel() async {
    var userViewModel: UserViewModel? = UserViewModel()
    
    userViewModel?.loadUser()
    
    try? await Task.sleep(for: .seconds(1))
    userViewModel?.cancelLoading()
    
    try? await Task.sleep(for: .seconds(2))
    userViewModel = nil
}


print("Start")

Task {
    
    await testViewModel()
    print("End")
}
