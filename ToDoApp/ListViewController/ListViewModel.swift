//
//  ListViewModel.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 15/02/2022.
//

import Foundation

class ListViewModel {
    
    var onOpenAddVC: ( () -> Void )?
    var taskManager = TaskManager.shared
    
    func shouldOpenAddVC () {
        self.onOpenAddVC?()
    }
    
}
