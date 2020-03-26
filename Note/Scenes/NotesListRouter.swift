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
    
    // MARK: - Переход в деталку заметки
    func goToDetailsNote(at index: Int?) {
        guard let parentFolder = interactor?.parentFolder else { return }
        let noteDetailsViewController = NoteDetailsViewController()
        if let index = index, let note = interactor?.notes?[index] {
            // Переход в уже существующую заметку
            noteDetailsViewController.router?.interactor?.passCurrentFolderAndCurrentNote(folder: parentFolder, note: note)
        } else {
            // Создание новой заметки
            noteDetailsViewController.router?.interactor?.passCurrentFolderAndCurrentNote(folder: parentFolder, note: nil)
        }
        view?.navController?.pushViewController(noteDetailsViewController, animated: true)
        
    }
}
