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
    
    func getTaskManager() -> TaskManager {
        return self.taskManager
    }
    
}
