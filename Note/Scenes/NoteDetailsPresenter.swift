//
//  NoteDetailsPresenter.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


class NoteDetailsPresenter: NoteDetailsPresenterProtocol {
    
    var view: NoteDetailsViewControllerProtocol?
    
    
    func presentNote(response: NoteDetails.NoteDetailsResponse) {
        let viewModel = NoteDetails.NoteDetailsViewModel(title: response.note.title, date: response.note.date, subtitle: response.note.subtitle)
        setupViewController(viewModel: viewModel)
    }
    
    func setupViewController(viewModel: NoteDetails.NoteDetailsViewModel) {
        view?.setupViewController(viewModel: viewModel)
    }
    
}
