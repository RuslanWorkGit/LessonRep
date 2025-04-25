//
//  CityDetailsViewController.swift
//  Clean Swift Test
//
//  Created by Ruslan Liulka on 25.04.2025.
//

import UIKit

class CityDetailsViewController: UIViewController {
    
    var city: Cities.City?
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 8
        return view
    }()
    
    private let nameLable = UILabel()
    private let populationLable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupUI()
        fillData()
    }
    
    private func setupUI() {
        view.addSubview(cardView)
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            cardView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [nameLable, populationLable])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
        cardView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
        
        nameLable.font = UIFont.boldSystemFont(ofSize: 24)
        populationLable.font = UIFont.systemFont(ofSize: 18)
        populationLable.textColor = .darkText
    }
    
    private func fillData() {
        guard let city = city else { return }
        
        nameLable.text = city.name
        populationLable.text = "Population: \(city.population)"
        self.title = city.name
    }
}
