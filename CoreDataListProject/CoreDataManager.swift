//
//  CoreDataManager.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import Foundation
import UIKit

class CoreDataManager {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models = [ToDoListItem]()
    var tableView = UITableView()
    
    // call all items of db
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest()) //subclass 추가하며 자동생성되었다.
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch let error {
            //error
            print(error)
        }
    }
    
    func createItem(name: String, record: Double) {
        print("Create: \(name)")
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.record = record
        newItem.createdAt = Date()
        
        do {
            try context.save()
            print("Save Success")
            getAllItems()
        } catch let error {
            print(error)
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch let error {
            print(error)
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
}
