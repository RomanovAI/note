//
//  FoldersListWorker.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import CoreData

class FoldersListWorker {
    
    static let sharedInstance = FoldersListWorker()
    
    let coreData = CoreDataStack.sharedInstance
    
    func fetchData() -> [Folder] {
        let foldersCD = coreData.fetchData()
        var folders: [Folder] = []
        
        for folder in foldersCD {
            let folder = Folder(id: folder.id, title: folder.title, notesCount: Int(folder.notesCount))
            folders.append(folder)
        }
        return folders
    }
    
    func saveNewFolder(folder: Folder) {
        coreData.addFolder(folder: folder)
    }
    
    func removeFolder(folder: Folder) {
        coreData.removeFolder(folder: folder)
    }

}
