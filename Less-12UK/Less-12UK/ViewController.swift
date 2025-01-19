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
    
    var array = [0, 1, 2, 3 ,4 ,5, 6, 7, 8, 9]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        present(CodeCollectionViewController(), animated: true)
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath) as? DefaultCollectionViewCell else {
            assertionFailure("Couldn't dequeue cell")
            return UICollectionViewCell()
        }
        
        cell.textLabel.text = "Row \(indexPath.row)"
        
        cell.deleteClousure = { [weak self, indexPath] in
            self?.array.remove(at: indexPath.row)
            self?.collectionView.deleteItems(at: [indexPath])
            
        }
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
