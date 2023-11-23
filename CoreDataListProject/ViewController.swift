//
//  ViewController.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import UIKit

class ViewController: UIViewController {
    
    // where to perform objects in the coredata db
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // call all items of db
    func getAllItems() {
        do {
            let items = try context.fetch(ToDoListItem.fetchRequest()) //subclass 추가하며 자동생성되었다.
        } catch let error {
            //error
            print(error)
        }
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
        } catch let error {
            print(error)
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
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

