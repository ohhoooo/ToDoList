//
//  ToDoListTableViewCell.swift
//  ToDoList
//
//  Created by 김정호 on 3/19/24.
//

import UIKit

final class ToDoListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    
    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
                titleLabel.text = toDo.title
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
