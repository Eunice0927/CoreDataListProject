//
//  StoryboardTableViewCell.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import UIKit

class StoryboardTableViewCell: UITableViewCell {
    @IBOutlet var rank: UILabel!
    @IBOutlet var record: UILabel!
    @IBOutlet var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
