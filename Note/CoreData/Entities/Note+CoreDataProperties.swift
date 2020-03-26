//
//  Note+CoreDataProperties.swift
//  Note
//
//  Created by Артем Романов on 25.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var date: Date
    @NSManaged public var id: String
    @NSManaged public var subtitle: String?
    @NSManaged public var title: String
    @NSManaged public var folder: Folder

}
