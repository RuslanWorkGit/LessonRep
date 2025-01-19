//
//  DefaultCollectionViewCell.swift
//  Less-12UK
//
//  Created by Ruslan Liulka on 14.01.2025.
//

import UIKit

class DefaultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var deleteClousure: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longAction))
        contentView.addGestureRecognizer(longPress)
    }
    
    @objc func longAction() {
        deleteClousure?()
    }
    
    
}
