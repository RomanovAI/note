//
//  NotesListModel.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

enum NotesList {
    
    struct NotesListRequest {
        
    }
    
    struct NotesListResponse {
        let notesList: [Note]
    }
    
    struct NotesListViewModel {
        let title: String
        let notesCount: Int
        
        let noteTableModel: NoteTableModel
    }
}


class NoteTableModel {
    
    private var notesList: [Note]
    
    var notesListCount: Int {
        return notesList.count
    }
    
    init(notesList: [Note]) {
        self.notesList = notesList
    }
    
    func cellModel(indexPath: IndexPath) -> NoteCellModel {
        let note = notesList[indexPath.row]
        return NoteCellModel(note: note)
    }
    
}


class NoteCellModel {
    
    private let note: Note
    
    var title: String {
        return note.title
    }
    
    var date: String {
        return "\(note.date)"
    }
    
    var subtitle: String? {
        return note.subtitle
    }
    
    init(note: Note) {
        self.note = note
    }
}
