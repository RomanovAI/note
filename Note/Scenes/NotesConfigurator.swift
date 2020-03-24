//
//  NotesConfigurator.swift
//  Note
//
//  Created by Артем Романов on 18.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class NotesConfigurator {
    
    static var sharedInstance = NotesConfigurator()
    
    func configure(with viewController: NotesListViewControllerProtocol) {
        let viewController = viewController
        let interactor = NotesListInteractor()
        let presenter = NotesListPresenter()
        let router = NotesListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.interactor = interactor
        router.view = viewController
    }
    
}
