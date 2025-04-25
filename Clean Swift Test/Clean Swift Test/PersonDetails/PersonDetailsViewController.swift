//
//  PersonDetails.swift
//  Clean Swift Test
//
//  Created by Ruslan Liulka on 25.04.2025.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    
    var person: PeopleList.Person?
    
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
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupUI()
        fillUI()
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
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
        cardView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        ageLabel.font = UIFont.systemFont(ofSize: 18)
        ageLabel.textColor = .darkText
    }
    
    private func fillUI() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        ageLabel.text = "Age is \(person.age)"
        self.title = person.name
    }
}
