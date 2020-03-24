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
    let worker = FoldersListWorker.sharedInstance
    var dataSource: Note?
    
    func fetchData() {
        guard let data = dataSource else { return }
        let response = NoteDetails.NoteDetailsResponse(note: data)
        presenter?.presentNote(response: response)
    }
    
    func saveInDataSource(note: Note) {
           print("note=", note)
       }
    
}
