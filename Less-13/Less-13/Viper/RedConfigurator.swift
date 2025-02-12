//
//  RedConfigurator.swift
//  Less-13
//
//  Created by Ruslan Liulka on 12.02.2025.
//

import Foundation

//Задача цього класу створити усі інстанси, налаштувати звʼязки між собою і повернтуи посилання ан Presenter
class RedConfigurator {

    func configure() -> RedModuleInput {
        
        let interactor = RedInteractor()
        let view = RedViewController()
        let router = RedRouter()
        
        let presenter = RedPresenter()
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        view.output = presenter
        interactor.output = presenter
        
        return presenter
    }
}
