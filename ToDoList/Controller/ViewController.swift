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
    
    var datas = [ToDo(title: "기본 할 일 목록 - 1"),
                 ToDo(title: "기본 할 일 목록 - 2"),
                 ToDo(title: "기본 할 일 목록 - 3"),
                 ToDo(title: "기본 할 일 목록 - 4"),
                 ToDo(title: "기본 할 일 목록 - 5")]
    
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
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoListTableViewCell
        cell.toDo = datas[indexPath.row]
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
