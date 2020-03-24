//
//  FoldersListRouter.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import UIKit


class FoldersListRouter: FoldersListRouterProtocol {
    
    var interactor: FoldersListInteractorProtocol?
    var view: FoldersListViewControllerProtocol?
    
    func goToNotesList(at index: Int) {
        guard let notesList = interactor?.dataSource?[index].notesList else { return }
        let notesListViewController = NotesListViewController()
        notesListViewController.router?.interactor?.saveInDataSource(notesList: notesList)
        view?.navController?.pushViewController(notesListViewController, animated: true)
    }
    
}
