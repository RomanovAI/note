//
//  NotesListProtocols.swift
//  Note
//
//  Created by Артем Романов on 18.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import UIKit

protocol NotesListRouterProtocol {
    var interactor: NotesListInteractorProtocol? { get set }
    var view: NotesListViewControllerProtocol? { get set }
    
    func goToDetailsNote(at index: Int?)
}

protocol NotesListInteractorProtocol {
    var presenter: NotesListPresenterProtocol? { get set }
    var parentFolder: Folder? { get }
    var notes: [Note]? { get }
    
    func fetchData()
    func passCurrentFolder(folder: Folder)
}

protocol NotesListPresenterProtocol {
    var view: NotesListViewControllerProtocol? { get set }
    
    func presentNoteslist(response: NotesList.NotesListResponse)
}

protocol NotesListViewControllerProtocol: class {
    var interactor: NotesListInteractorProtocol? { get set }
    var router: NotesListRouterProtocol? { get set }
    var navController: UINavigationController? { get }
    
    func setupViewController(with viewModel: NotesList.NotesListViewModel)
}

