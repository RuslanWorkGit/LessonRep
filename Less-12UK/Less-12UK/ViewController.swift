//
//  ViewController.swift
//  Less-12UK
//
//  Created by Ruslan Liulka on 14.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(CodeCollectionViewController(), animated: true)
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath) as? DefaultCollectionViewCell else {
            assertionFailure("Couldn't dequeue cell")
            return UICollectionViewCell()
        }
        
        cell.textLabel.text = "Row \(indexPath.row)"
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
