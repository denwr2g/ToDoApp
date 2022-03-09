//
//  AddItemViewController.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 16/02/2022.
//

import UIKit
import SnapKit

class AddItemViewController: UIViewController {
    
    private var addItemViewModel: AddItemViewModel?
    var newView = NewView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configure(addItemViewModel: AddItemViewModel) {
        self.addItemViewModel = addItemViewModel
    }
    
}
                                        
                                        
private extension AddItemViewController {

    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Add item"

        newView.addItemButton.addAction(addAction(), for: .touchUpInside)
        
        view.addSubview(newView)
        newView.snp.makeConstraints({ make in
            make.left.right.top.bottom.equalToSuperview().inset(5)
        })
    }
    
    func addAction() -> UIAction {
        let action = UIAction { [weak self] _ in
            guard let self = self else {return}
            self.addItemViewModel?.addValue(productName: self.newView.productNameTextField.text, productCount: self.newView.productCountTextField.text)
        }
    
        return action
    }
}
