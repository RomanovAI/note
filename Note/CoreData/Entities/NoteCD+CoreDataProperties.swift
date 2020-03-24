//
//  NoteCD+CoreDataProperties.swift
//  Note
//
//  Created by Артем Романов on 24.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//
//

import Foundation
import CoreData


extension NoteCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteCD> {
        return NSFetchRequest<NoteCD>(entityName: "NoteCD")
    }

    @NSManaged public var subtitle: String?
    @NSManaged public var title: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: String?
    @NSManaged public var folder: FolderCD?

}
