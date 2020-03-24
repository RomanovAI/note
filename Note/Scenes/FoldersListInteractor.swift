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
    var worker = FoldersListWorker()
    var dataSource: [Folder]?
    
    init() {
        let foldersList = worker.foldersList
        dataSource = foldersList
    }
    
    func fetchData() {
        guard let data = dataSource else { return }
        let response = FoldersList.FoldersListResponse(foldersList: data)
        presenter?.presentFoldersList(response: response)
    }
    
    func saveNewFolder(request: FoldersList.FoldersListRequest) {
        let newFolder = Folder(title: request.title, count: 0)
        worker.foldersList.append(newFolder)
        fetchData()
    }
    
}

