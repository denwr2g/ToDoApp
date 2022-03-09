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
    var onShowAllert: (() -> Void)?
    var onAddAction: (() -> Void)?

    private var taskManager = TaskManager.shared
    
    func shouldOpenListVC() {
        self.onOpenListVC?()
    }
    
    func shouldShowAlert() {
        self.onShowAllert?()
    }
    
    func shouldAddAction() {
        self.onAddAction?()
    }
    
    func addValue(productName: String?, productCount: String?) {
        guard let name = productName, name != "",  let count = productCount , count != "" else {return shouldShowAlert()}
            taskManager.data.append(Product(productName: name, productCount: count))
            shouldOpenListVC()
    }
    
}
