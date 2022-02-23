//
//  TaskManager.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 16/02/2022.
//

import Foundation

class TaskManager {
    
    static var shared = TaskManager()
    
    @Storage(key: "@com.denisslobacs.todo10", defaultValue: [])
    var data: [String?]
    
    private init(){}
    
    func addValue(value: String?) {
        if let value = value {
            data.append(value)
        }
    }
    
    func getValue(index: Int) -> String? {
        guard data.count > index else {return ""}
        return data[index]
    }
    
}
