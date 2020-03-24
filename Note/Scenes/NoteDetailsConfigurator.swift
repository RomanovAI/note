//
//  NoteDetailsConfigurator.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class NoteDetailsConfigurator {
    static let sharedInstance = NoteDetailsConfigurator()
    
    func configure(with viewController: NoteDetailsViewControllerProtocol) {
        let viewController = viewController
        let interactor = NoteDetailsInteractor()
        let presenter = NoteDetailsPresenter()
        let router = NoteDetailsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.interactor = interactor
    }
}
