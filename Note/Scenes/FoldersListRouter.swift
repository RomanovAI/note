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
    
    // MARK: - Переход в список заметок текущей папки
    func goToNotesList(at index: Int) {
        guard let folder = interactor?.folders?[index] else { return }
        let notesListViewController = NotesListViewController()
        notesListViewController.router?.interactor?.passCurrentFolder(folder: folder)
        view?.navController?.pushViewController(notesListViewController, animated: true)
    }
    
}
