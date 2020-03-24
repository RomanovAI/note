//
//  FoldersListModel.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import UIKit


struct Folder {
    let id: String
    let title: String
    let notesCount: Int
    
    var notesList = [Note]()
}

enum FoldersList {
    
    struct FoldersListRequest {
        let title: String?
        let index: Int?
    }
    
    struct FoldersListResponse {
        let foldersList: [Folder]
        
    }
    
    struct FoldersViewModel {
        let title: String
        
        let rightNavigationBarButtonTitle: String
        let RightToolBarButtonTitle: String
        
        let alerControllerModel: FolderAlertControllerModel
        
        let folderTableMode: FolderTableModel
    }
}


struct FolderAlertControllerModel {
    let alertControllerTitle: String
    let alertControllerMessage: String
    let alertControllerTextFieldPlaceholder: String
    let alertControllerSaveButtonTitle: String
    let alertControllerCancelButtonTitle: String
}


class FolderTableModel {
    
    private var foldersList: [Folder]
    
    var folderslistCount: Int {
        return foldersList.count
    }
    
    init(foldersList: [Folder]) {
        self.foldersList = foldersList
    }
    
    func cellModel(indexPath: IndexPath) -> FolderCellModel {
        let folder = foldersList[indexPath.row]
        return FolderCellModel(folder: folder)
    }
    
}


class FolderCellModel {
    
    private let folder: Folder
    
    var title: String {
        return folder.title
    }
    
    var count: String {
        return String(folder.notesCount)
    }
    
    init(folder: Folder) {
        self.folder = folder
    }
}
