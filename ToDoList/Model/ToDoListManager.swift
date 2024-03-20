//
//  ToDoListManager.swift
//  ToDoList
//
//  Created by 김정호 on 3/20/24.
//

import Foundation

final class ToDoListManager {
    
    // MARK: - properties
    private var toDoList = [ToDo(title: "기본 할 일 목록 - 1"),
                            ToDo(title: "기본 할 일 목록 - 2"),
                            ToDo(title: "기본 할 일 목록 - 3"),
                            ToDo(title: "기본 할 일 목록 - 4"),
                            ToDo(title: "기본 할 일 목록 - 5")]
    
    var datas: [ToDo] {
        toDoList
    }
    
    var count: Int {
        toDoList.count
    }
    
    // MARK: - methods
    func addToDo(toDo: ToDo) {
        toDoList.append(toDo)
    }
    
    func toggleIsCompleted(index: Int) {
        toDoList[index].isCompleted = (toDoList[index].isCompleted) ? false : true
    }
}
