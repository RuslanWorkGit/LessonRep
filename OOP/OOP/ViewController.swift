//
//  ViewController.swift
//  OOP
//
//  Created by Ruslan Liulka on 17.04.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func oopAction(_ sender: Any) {
        
        let bankAccount = BackAccount()
        
        bankAccount.depositn(amount: 100)
        bankAccount.showBalance()
    }
    @IBAction func solidAction(_ sender: Any) {
    }
    
}

