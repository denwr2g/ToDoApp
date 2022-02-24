//
//  TaskManager.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 16/02/2022.
//

import Foundation

class TaskManager {
    
    static var shared = TaskManager()
    
    var data = [Product?]()
    
    private init(){}
    
    func addValue(productName: String?, productCount: String?) {
        if let name = productName, let count = productCount {
            data.append(Product(productName: name, productCount: count))
        }
    }
    
    func getValue(index: Int) -> Product? {
        guard data.count > index else {return nil}
        return data[index]
    }
    
}
