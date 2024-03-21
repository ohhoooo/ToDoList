//
//  ToDo.swift
//  ToDoList
//
//  Created by 김정호 on 3/19/24.
//

import Foundation

struct ToDo {
    private static var count = 0
    private var id: Int
    
    var isCompleted: Bool = false
    var title: String
    let date: Date
    
    init(title: String) {
        Self.count += 1
        self.id = Self.count
        self.title = title
        self.date = Date()
    }
}
