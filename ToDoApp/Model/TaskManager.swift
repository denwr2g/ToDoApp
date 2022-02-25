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
    
    func addValue(product: Product?) {
        guard let product = product else {return}
        data.append(product)
        
    }
    
    func getValue(index: Int) -> Product? {
        guard data.count > index else {return nil}
        return data[index]
    }
    
}

