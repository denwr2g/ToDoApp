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
    
    func getValue(index: Int) -> String? {
        guard taskManager.data.count > index else {return ""}
        return taskManager.data[index]
    }
    
    func getArray() -> [String?] {
        return taskManager.data
    }
    
    
    
}
