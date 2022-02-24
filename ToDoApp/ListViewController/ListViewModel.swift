//
//  ListViewModel.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 15/02/2022.
//

import Foundation

class ListViewModel {
    
    var onOpenAddVC: (() -> Void)?
    private var taskManager = TaskManager.shared
    
    func shouldOpenAddVC () {
        self.onOpenAddVC?()
    }
    
    func getValue(index: Int) -> Product? {
        guard taskManager.data.count > index else {return nil}
        return taskManager.data[index]
    }
    
    func getArray() -> [Product?] {
        return taskManager.data
    }
    
    
    
}
