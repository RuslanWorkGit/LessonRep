//
//  RedPresenter.swift
//  Less-13
//
//  Created by Ruslan Liulka on 12.02.2025.
//

import UIKit

protocol RedModuleInput: AnyObject {
    
}

protocol RedModuleOutput: AnyObject {
    
}

class RedPresenter {
    
    var moduleOutput: RedModuleOutput?
    
    var view: RedViewInput?
    var interactor: RedInteractorInput?
    var router: RedRouterInput?
    
}

extension RedPresenter: RedViewOutput {
    func loginButtonTappped() {
        interactor?.loadData()
    }
    
    
}

extension RedPresenter: RedInteractorOutput {
    
    func dataDidLoad(data: UserData) {
        
        //oruter to
        
        router?.showHomeScreen()
    }
}

extension RedPresenter: RedModuleInput {
    
}
