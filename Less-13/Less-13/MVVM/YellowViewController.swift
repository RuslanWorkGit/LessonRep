//
//  YellowViewController.swift
//  Less-13
//
//  Created by Ruslan Liulka on 10.02.2025.
//

import UIKit

//View for MVVM
class YellowViewController: UIViewController {
    
    private let nameLable = UILabel()
    private let fetchButton = UIButton(type: .system)
    
    //посилання на viewModel
    private let viewModel = YellowViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        nameLable.text = "Loading..."
        nameLable.textAlignment = .center
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        
        fetchButton.setTitle("Fetch User", for: .normal)
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.addTarget(self, action: #selector(fetchButtonTapped), for: .touchUpInside)
        
        view.addSubview(nameLable)
        view.addSubview(fetchButton)
        
        NSLayoutConstraint.activate([
            nameLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            fetchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
    }
    
    private func setupBindings() {
        viewModel.updateProductName = { [weak self] name in
            self?.nameLable.text = name
        }
    }
    
    @objc func fetchButtonTapped() {
        viewModel.fetchProduct()
    }
    
}
