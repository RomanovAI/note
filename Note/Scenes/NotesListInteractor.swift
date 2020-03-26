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
    let worker = Worker.sharedInstance
    var parentFolder: Folder?
    var notes: [Note]?
    
    func fetchData() {
        guard let folder = parentFolder else { return }
        notes = worker.fetchNotes(parentfolder: folder)
        guard let notesList = notes else { return }
        let response = NotesList.NotesListResponse(notesList: notesList)
        presenter?.presentNoteslist(response: response)
    }
    
    func passCurrentFolder(folder: Folder) {
        parentFolder = folder
    }
}
