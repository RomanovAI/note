//
//  NoteDetailsInteractor.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class NoteDetailsInteractor: NoteDetailsInteractorProtocol {
    
    var presenter: NoteDetailsPresenterProtocol?
    let worker = Worker.sharedInstance
    var parentFolder: Folder?
    var note: Note?
    
    func fetchData() {
        guard let note = note else { return }
        let response = NoteDetails.NoteDetailsResponse(note: note)
        presenter?.presentNote(response: response)
    }
    
    func passCurrentFolderAndCurrentNote(folder: Folder, note: Note?) {
        parentFolder = folder
        self.note = note
    }
    
    func addNote(title: String) {
        guard let folder = parentFolder else { return }
        let date = Date()
        var id: String
        if let noteId = note?.id {
            id = noteId
        } else {
            id = "\(date)"
        }
        
        let subtitle = title
        worker.addNote(parentFolder: folder, id: id, title: title, date: date, subtitle: subtitle)
    }
    
}
