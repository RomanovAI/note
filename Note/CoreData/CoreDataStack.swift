//
//  CoreDataStack.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let sharedInstance = CoreDataStack()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Note")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        return context
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Получение всех папок
    func fetchFolders() -> [Folder] {
        var folders: [Folder] = []
        
        do {
            folders = try context.fetch(Folder.fetchRequest())
        } catch let error as NSError {
            print("fetch (\(error.localizedDescription))")
        }
        return folders
    }
    
    // MARK: - Получение всех заметока в текущей папке
    func fetchNotes(parentfolder: Folder) -> [Note] {
        let fetchRequest: NSFetchRequest<Folder> = Folder.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@ ", parentfolder.id)
        var notes: [Note] = []
        
        do {
            let folders = try context.fetch(fetchRequest)
            guard let temporaryNotes = folders.first?.notes?.array as? [Note] else { return [] }
            notes = temporaryNotes
            
        } catch let error as NSError {
            print("fetch notes=", error.localizedDescription)
        }
        
        return notes
    }
    
    // MARK: - Добавление папки
    func addFolder(id: String, title: String) {
        let folder = Folder(context: context)
        folder.id = id
        folder.title = title
        folder.notesCount = 0
        
        do {
            try context.save()
        } catch let error as NSError {
            print("addFolder \(error.localizedDescription)")
        }
    }
    
    // MARK: - Удаление папки
    func removeFolder(folder: Folder) {
        let fetchRequest: NSFetchRequest<Folder> = Folder.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", folder.id)
        
        do {
            let folders = try context.fetch(fetchRequest)
            if let folder = folders.first {
                context.delete(folder)
                try context.save()
            }
        } catch let error as NSError {
            print("removeFolder=", error.localizedDescription)
        }
    }
    
    // MARK: - Добавление заметки в текущую папку
    func addNote(parentFolder: Folder, id: String, title: String, date: Date, subtitle: String) {
        let fetchRequest: NSFetchRequest<Folder> = Folder.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", parentFolder.id)
        
        let folderEntity = Folder(context: context)
        guard let folderContext = folderEntity.managedObjectContext else { return }
        
        let newNote = Note(context: folderContext)
        newNote.id = id
        newNote.title = title
        newNote.date = date
        newNote.subtitle = subtitle
        
        do {
            let folders = try context.fetch(fetchRequest)
            guard let folder = folders.first,
                let notes = folder.notes?.array as? [Note]
                else { return }
            // Если заметок вообще не было
            if notes.count == 0 {
                folder.addToNotes(newNote)
                folder.notesCount += 1
            } else {
                // Если заметки есть и
                for (index, item ) in notes.enumerated() {
                    // нашлась заметка с таким же айдишником
                    if item.id == id {
                        folder.replaceNotes(at: index, with: newNote)
                        break
                    } else {
                        // не нашлась заметка с таким же айдишником
                        folder.addToNotes(newNote)
                        folder.notesCount += 1
                        break
                    }
                }
            }
            try context.save()
        } catch let error as NSError {
            print("add note ", error.localizedDescription)
        }
    }
}
