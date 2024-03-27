//
//  ToDoListTableViewCell.swift
//  ToDoList
//
//  Created by 김정호 on 3/19/24.
//

import UIKit

final class ToDoListTableViewCell: UITableViewCell {

    // MARK: - properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompletedSwitch: UISwitch!
    
    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
                titleLabel.text = toDo.title
                titleLabel.attributedText = (toDo.isCompleted) ? titleLabel.text?.strikeThrough() : titleLabel.text?.removeStrikethrough()
                isCompletedSwitch.isOn = toDo.isCompleted
            }
        }
    }
    
    var toggleIsCompleted: (() -> ())?
    
    // MARK: - methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTappedSwitch(_ sender: UISwitch) {
        // 스위치 값 변경에 따른 가로선 적용 유/무
        titleLabel.attributedText = (sender.isOn) ? titleLabel.text?.strikeThrough() : titleLabel.text?.removeStrikethrough()
        
        // ToDo의 isCompleted 값 변경
        toggleIsCompleted!()
    }
}
