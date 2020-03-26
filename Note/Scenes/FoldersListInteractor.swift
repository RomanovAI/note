//
//  FoldersListInteractor.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation

class FoldersListInteractor: FoldersListInteractorProtocol {
    
    var presenter: FoldersListPresenterProtocol?
    var worker = Worker.sharedInstance
    var folders: [Folder]?
    
    func fetchData() {
        folders = worker.fetchFolders()
        guard let folders = folders else { return }
        let response = FoldersList.FoldersListResponse(foldersList: folders)
        presenter?.presentFoldersList(response: response)
    }
    
    func addFolder(_ request: FoldersList.FoldersListRequest) {
        guard let title = request.title else { return }
        let id = "\(Date())"
        worker.addFolder(title: title, id: id)
        fetchData()
    }
    
    func removeFolder(_ request: FoldersList.FoldersListRequest) {
        guard let index = request.index, let folder = folders?[index] else { return }
        worker.removeFolder(folder: folder)
        fetchData()
    }
    
}

