//
//  ViewController.swift
//  Les23
//
//  Created by Ruslan Liulka on 05.05.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: CircleView!
    @IBOutlet weak var customDrawingView: CustomDrawingView!
    @IBOutlet weak var gradientView: GradientView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleView.backgroundColor = .gray
        customDrawingView.backgroundColor = .gray
    }


}

