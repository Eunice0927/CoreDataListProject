//
//  ToDoListItem+CoreDataProperties.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        var request = NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
        let sortDescriptor = NSSortDescriptor(key: "record", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var record: Double

}

extension ToDoListItem : Identifiable {

}
