//
//  RedViewController.swift
//  Less-13
//
//  Created by Ruslan Liulka on 12.02.2025.
//

import UIKit

protocol RedViewOutput: AnyObject {
    func loginButtonTappped()
}

protocol RedViewInput: AnyObject {
    
}

//В рамках Viper це просто View, для Presenter 
class RedViewController: UIViewController {
    
    weak var output: RedViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func loginButtonDidTapped() {
        output?.loginButtonTappped()
    }
}

extension RedViewController: RedViewInput {
    
}
