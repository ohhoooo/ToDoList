//
//  ToDo.swift
//  ToDo
//
//  Created by 김정호 on 3/19/24.
//

struct ToDo {
    private static var count = 0
    private var id: Int
    
    var isCompleted: Bool = false
    var title: String
    
    init(title: String) {
        Self.count += 1
        self.id = Self.count
        self.title = title
    }
}
