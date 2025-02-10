//
//  BlueViewControler.swift
//  Less-13
//
//  Created by Ruslan Liulka on 30.01.2025.
//

import UIKit

class BlueViewControler: UIViewController {
    
    @IBOutlet weak var contentView: BlueView!
    var model: BlueModel? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        setup()
    }
    
    func setup() {
        contentView.delegate = self
        
        model = BlueModel()
        model?.delegate = self
    }
    
}

//MARK: - BlueViewDelegate
extension BlueViewControler: BlueViewDelegate {
    func loadDataDidTap() {
        model?.loadData()
    }
    
    
}

//MARK: - BlueModelDelegate
extension BlueViewControler: BlueModelDelegate {
    func didLoadData(text: String, success: Bool) {
        contentView.updateUI(with: text, success: success)
    }
}
