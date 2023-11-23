//
//  ViewController.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import UIKit

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // where to perform objects in the coredata db
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        return table
    }()
    
    private var models = [ToDoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Score"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.getAllItems()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }

    
    // MARK: - CoreData
    
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

