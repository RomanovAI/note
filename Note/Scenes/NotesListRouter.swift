//
//  NotesListRouter.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class NotesListRouter: NotesListRouterProtocol {
    
    var interactor: NotesListInteractorProtocol?
    var view: NotesListViewControllerProtocol?
    
    func goToDetailsNote(at index: Int?) {
        let noteDetailsViewController = NoteDetailsViewController()
        view?.navController?.pushViewController(noteDetailsViewController, animated: true)
        guard let index = index, let note = interactor?.dataSource?[index] else { return }
        noteDetailsViewController.router?.interactor?.saveInDataSource(note: note)
    }
}
