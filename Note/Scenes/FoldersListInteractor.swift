//
//  FoldersListInteractor.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import UIKit


class FoldersListInteractor: FoldersListInteractorProtocol {
    
    var presenter: FoldersListPresenterProtocol?
    var worker = FoldersListWorker.sharedInstance
    var dataSource: [Folder]?
    
    func fetchData() {
        dataSource = worker.fetchData()
        guard let data = dataSource else { return }
        let response = FoldersList.FoldersListResponse(foldersList: data)
        presenter?.presentFoldersList(response: response)
    }
    
    func saveNewFolder(_ request: FoldersList.FoldersListRequest) {
        guard let title = request.title else { return }
        let id = "\(Date())"
        let newFolder = Folder(id: id, title: title, notesCount: 0)
        worker.saveNewFolder(folder: newFolder)
        fetchData()
    }
    
    func removeFolder(_ request: FoldersList.FoldersListRequest) {
        guard let index = request.index, let folder = dataSource?[index] else { return }
        worker.removeFolder(folder: folder)
        fetchData()
    }
    
}

