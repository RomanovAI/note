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
    
    func fetchData() -> [FolderCD] {
        let fetchRequest: NSFetchRequest<FolderCD> = FolderCD.fetchRequest()
        var foldersCD: [FolderCD] = []
  
        do {
            foldersCD = try context.fetch(fetchRequest)
        
        } catch let error as NSError {
            print("fetch (\(error.localizedDescription))")
        }
        return foldersCD
    }
    
    func addFolder(folder: Folder) {
        guard let entity = NSEntityDescription.entity(forEntityName: "FolderCD", in: context) else { return }
        let folderCD = FolderCD(entity: entity, insertInto: context)
        folderCD.id = folder.id
        folderCD.title = folder.title
        folderCD.notesCount = Int16(folder.notesCount)

        do {
            try context.save()
        } catch let error as NSError {
            print("addFolder \(error.localizedDescription)")
        }
    }
    
    
    func removeFolder(folder: Folder) {
        let fetchRequest: NSFetchRequest<FolderCD> = FolderCD.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", folder.id)
        
        do {
            let foldersCD = try context.fetch(fetchRequest)
            if let folder = foldersCD.first {
                context.delete(folder)
                try context.save()
            }
            
        } catch let error as NSError {
            print("removeFolder=", error.localizedDescription)
        }
    }
}
