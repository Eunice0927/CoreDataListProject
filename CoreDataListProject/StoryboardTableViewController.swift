//
//  StoryboardTableViewController.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import UIKit

class StoryboardTableViewController: UITableViewController {
    let coreDataManager = CoreDataManager()
    @IBOutlet var storyboardTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreDataManager.tableView = storyboardTableView
        self.tableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.coreDataManager.getAllItems()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager.models.count >= 20 ? 20 : coreDataManager.models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = coreDataManager.models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyboardCell", for: indexPath) as! StoryboardTableViewCell
        let date = model.createdAt?.formatted(date: .numeric, time: .standard)
        cell.rank.text = "\(indexPath[1] + 1)"
        cell.record.text = model.name
        cell.time.text = "\(date ?? "No time Data")"
        
        return cell
    }
}
