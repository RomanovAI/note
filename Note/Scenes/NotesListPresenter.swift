//
//  NotesListPresenter.swift
//  Note
//
//  Created by Артем Романов on 18.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


class NotesListPresenter: NotesListPresenterProtocol {
    
    var view: NotesListViewControllerProtocol?
    
    func presentNoteslist(response: NotesList.NotesListResponse) {
        let noteTableModel = NoteTableModel(notesList: response.notesList)
        let viewModel = NotesList.NotesListViewModel(title: "Заметки", notesCount: response.notesList.count, noteTableModel: noteTableModel)
        
        setupViewController(viewModel: viewModel)
    }
    
    private func setupViewController(viewModel: NotesList.NotesListViewModel) {
        view?.setupViewController(with: viewModel)
    }
}
