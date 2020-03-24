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
    
    var foldersList: [Folder] = {
        var foldersList = [Folder]()
        var folder1 = Folder(title: "Заметки", count: 10)
        folder1.notesList = [Note(title: "lala", date: "22-10-2020", subtitle: "asd")]
        foldersList.append(folder1)
        return foldersList
    }()
    
    
    func saveNewFolderInCoreData(folder: Folder) {
       
    }

}
