//
//  BlueView.swift
//  Less-13
//
//  Created by Ruslan Liulka on 06.02.2025.
//

import UIKit

protocol BlueViewDelegate: AnyObject {
    func loadDataDidTap()
}

class BlueView: UIView {
    
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var resultLable: UILabel!
    
    weak var delegate: BlueViewDelegate?
    
    func updateUI(with text: String, success: Bool) {
        resultLable.textColor = success ? .black : .red
        resultLable.text = text
    }
    
    @IBAction func loadButtonAction(_ sender: Any) {
        
        delegate?.loadDataDidTap()
    }
}
