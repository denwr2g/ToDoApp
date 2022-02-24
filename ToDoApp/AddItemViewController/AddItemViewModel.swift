//
//  AddItemViewModel.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 16/02/2022.
//

import Foundation
import UIKit

class AddItemViewModel {
    
    var onOpenListVC: (() -> Void)?
    private var taskManager = TaskManager.shared
    
    func shouldOpenListVC() {
        self.onOpenListVC?()
    }
    
    
    func addValue(productName: String?, productCount: String?) {
        guard let name = productName, let count = productCount else {return}
        if productName != "" && productCount != "" {
            taskManager.data.append(Product(productName: name, productCount: count))
            shouldOpenListVC()
        } else {return}
    }
    
}
