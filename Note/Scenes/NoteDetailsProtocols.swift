//
//  NoteDetailsProtocols.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

protocol NoteDetailsRouterProtocol {
    var interactor: NoteDetailsInteractorProtocol? { get set }
    var view: NoteDetailsViewControllerProtocol? { get set }
}


protocol NoteDetailsInteractorProtocol {
    var presenter: NoteDetailsPresenterProtocol? { get set }
    var parentFolder: Folder? { get }
    var note: Note? { get set }
    
    func passCurrentFolderAndCurrentNote(folder: Folder, note: Note?)
    func fetchData()
    
    func addNote(title: String)
}

protocol NoteDetailsPresenterProtocol {
    var view: NoteDetailsViewControllerProtocol? { get set }
    
    func presentNote(response: NoteDetails.NoteDetailsResponse)
}

protocol NoteDetailsViewControllerProtocol: class {
    var interactor: NoteDetailsInteractorProtocol? { get set }
    var router: NoteDetailsRouterProtocol? { get set }
    
    func setupViewController(viewModel: NoteDetails.NoteDetailsViewModel)
}

