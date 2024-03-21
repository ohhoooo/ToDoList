//
//  ViewController.swift
//  ToDoList
//
//  Created by 김정호 on 3/19/24.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - properties
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    let toDoListManager = ToDoListManager()
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setNavigation()
    }

    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "ToDoListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ToDoCell")
    }
    
    private func setNavigation() {
        self.navigationController?.navigationBar.topItem?.title = "To Do"
    }
    
    @IBAction func didTappedEditButton(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            editButton.title = "Edit"
            tableView.setEditing(false, animated: true)
        } else {
            editButton.title = "Done"
            tableView.setEditing(true, animated: true)
        }
    }
    
    @IBAction func didTappedPlusButton(_ sender: UIBarButtonItem) {
        let title = "할 일 추가"
        
        // alert
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        // action
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let add = UIAlertAction(title: "추가", style: .default) { [self] _ in
            if let textField = alert.textFields?.first {
                if textField.text?.isEmpty != true {
                    toDoListManager.addToDo(toDo: ToDo(title: textField.text!))
                    tableView.reloadData()
                }
            }
        }
        
        alert.addTextField { $0.placeholder = "할 일을 입력하세요" }
        alert.addAction(cancel)
        alert.addAction(add)
        
        self.present(alert, animated: true)
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListManager.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoListTableViewCell
        
        cell.toDo = toDoListManager.datas[indexPath.row]
        cell.toggleIsCompleted = { [weak self] in
            self?.toDoListManager.toggleIsCompleted(index: indexPath.row)
        }
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 특정 indexPath row의 editingStyle 설정
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoListManager.removeToDo(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // Edit Mode에서의 특정 Cell 행 이동
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        toDoListManager.moveToDo(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}
