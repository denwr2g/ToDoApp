//
//  AddItemViewModel.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 16/02/2022.
//

import Foundation

class AddItemViewModel {
    
    var onOpenListVC: (() -> Void)?
    private var taskManager = TaskManager.shared
    
    func shouldOpenListVC() {
        self.onOpenListVC?()
    }
    
    func addValue(value: String?) {
        guard let value = value else { return }
        taskManager.data.append(value)
        shouldOpenListVC()
    }
    
}
