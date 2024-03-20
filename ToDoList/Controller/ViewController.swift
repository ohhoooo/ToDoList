//
//  ViewController.swift
//  ToDoList
//
//  Created by 김정호 on 3/19/24.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - properties
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let toDoListManager = ToDoListManager()
    
    // MARK: - methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }

    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "ToDoListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ToDoCell")
    }
    
    @IBAction func didTappedPlusButton(_ sender: UIButton) {
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
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
