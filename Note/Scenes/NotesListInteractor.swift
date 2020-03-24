//
//  NotesListInteractor.swift
//  Note
//
//  Created by Артем Романов on 18.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


class NotesListInteractor: NotesListInteractorProtocol {
    
    var presenter: NotesListPresenterProtocol?
    var dataSource: [Note]?
    
    func fetchData() {
        guard let data = dataSource else { return }
        let response = NotesList.NotesListResponse(notesList: data)
        presenter?.presentNoteslist(response: response)
    }
    
    func saveInDataSource(notesList: [Note]) {
        dataSource = notesList
    }
}
