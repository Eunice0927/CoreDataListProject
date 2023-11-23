//
//  ViewController.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import UIKit

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let coreDataManager = CoreDataManager()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Score"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        coreDataManager.tableView = tableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.coreDataManager.getAllItems()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = coreDataManager.models[indexPath.row]
        
        let sheet = UIAlertController(title: "Delete", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.coreDataManager.deleteItem(item: item)
        }))
        
        present(sheet, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = coreDataManager.models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "\(model.name) - \(model.createdAt)"
        cell.textLabel?.text = model.name
        return cell
    }
}

