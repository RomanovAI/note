//
//  FoldersListConfigurator.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class FoldersListConfigurator {
    
    static let sharedInstance = FoldersListConfigurator()
    
    func configure(with viewController: FoldersListViewControllerProtocol) {
        let viewController = viewController
        let interactor = FoldersListInteractor()
        let presenter = FoldersListPresenter()
        let router = FoldersListRouter()
    
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.view = viewController
        router.interactor = interactor
        router.view = viewController
    }
    
}
