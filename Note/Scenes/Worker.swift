//
//  FoldersListWorker.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import CoreData

class Worker {
    
    static let sharedInstance = Worker()
    
    let coreData = CoreDataStack.sharedInstance
    
    func fetchFolders() -> [Folder] {
        return coreData.fetchFolders()
    }
    
    func fetchNotes(parentfolder: Folder) -> [Note] {
        return coreData.fetchNotes(parentfolder: parentfolder)
    }
    
    func addFolder(title: String, id: String) {
        coreData.addFolder(id: id, title: title)
    }
    
    func removeFolder(folder: Folder) {
        coreData.removeFolder(folder: folder)
    }
    
    func addNote(parentFolder: Folder, id: String, title: String, date: Date, subtitle: String) {
        coreData.addNote(parentFolder: parentFolder, id: id, title: title, date: date, subtitle: subtitle)
    }

}
