//
//  ViewController.swift
//  Less-13
//
//  Created by Ruslan Liulka on 30.01.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showRedScreen(_ sender: Any) {
//         let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
//
//        present(secondVC, animated: true)
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondVC = SecondViewController()
//        secondVC.view.backgroundColor = .red
        
     
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        
        let nav1 = UINavigationController(rootViewController: vc1)
    
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green
        
        let nav2 = UINavigationController(rootViewController: vc2)
        
        let mainMenuVC = UITabBarController()
        mainMenuVC.viewControllers = [nav1, nav2]
//        navigationController?.pushViewController(mainMenuVC, animated: true)
        navigationController?.setViewControllers([mainMenuVC], animated: true)
        
//        let tabBar = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//
//        if let navController = self.navigationController {
//            //navController.pushViewController(secondVC, animated: true)
//            navController.pushViewController(tabBar, animated: true)
// 
//        } else {
//            present(secondVC, animated: true)
//        }
//        

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowSecondVC" {
//            debugPrint("ShowSecondVC")
//            if let vc = segue.destination as? SecondViewController {
//                vc.view.backgroundColor = .black
//            }
//        }
//    }


}

