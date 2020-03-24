//
//  FolderCD+CoreDataProperties.swift
//  Note
//
//  Created by Артем Романов on 24.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//
//

import Foundation
import CoreData


extension FolderCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FolderCD> {
        return NSFetchRequest<FolderCD>(entityName: "FolderCD")
    }

    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var notesCount: Int16
    @NSManaged public var notes: NSOrderedSet?

}

// MARK: Generated accessors for notes
extension FolderCD {

    @objc(insertObject:inNotesAtIndex:)
    @NSManaged public func insertIntoNotes(_ value: NoteCD, at idx: Int)

    @objc(removeObjectFromNotesAtIndex:)
    @NSManaged public func removeFromNotes(at idx: Int)

    @objc(insertNotes:atIndexes:)
    @NSManaged public func insertIntoNotes(_ values: [NoteCD], at indexes: NSIndexSet)

    @objc(removeNotesAtIndexes:)
    @NSManaged public func removeFromNotes(at indexes: NSIndexSet)

    @objc(replaceObjectInNotesAtIndex:withObject:)
    @NSManaged public func replaceNotes(at idx: Int, with value: NoteCD)

    @objc(replaceNotesAtIndexes:withNotes:)
    @NSManaged public func replaceNotes(at indexes: NSIndexSet, with values: [NoteCD])

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: NoteCD)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: NoteCD)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSOrderedSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSOrderedSet)

}
