//
//  AddItemViewController.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 16/02/2022.
//

import UIKit
import SnapKit

class AddItemViewController: UIViewController {
    
    var addItemViewModel: AddItemViewModel?
    
    let addItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(goToListVC), for: .touchUpInside)
        return button
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "Input Text",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        textField.textColor = .white
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func getItemName() -> String? {
        return textField.text
    }
    
    func configure(addItemViewModel: AddItemViewModel) {
        self.addItemViewModel = addItemViewModel
    }
    
    @objc func goToListVC() {
        addItemViewModel?.taskManager.addValue(value: textField.text ?? "")
        addItemViewModel?.shouldOpenListVC()
    }
    
}

extension AddItemViewController {
    
    func configureUI() {
        view.backgroundColor = .purple
        navigationItem.title = "Add item"
        
        view.addSubview(addItemButton)
        addItemButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(addItemButton).offset(100)
            make.centerX.equalToSuperview()
        }
    }
}
