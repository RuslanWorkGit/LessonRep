//
//  RedRouter.swift
//  Less-13
//
//  Created by Ruslan Liulka on 12.02.2025.
//

import UIKit

protocol RedRouterInput: AnyObject {
    func showHomeScreen()
}

class RedRouter {
    
    var navigationController: UINavigationController?
}

extension RedRouter: RedRouterInput {
    func showHomeScreen() {
        
        let vc = UIViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
