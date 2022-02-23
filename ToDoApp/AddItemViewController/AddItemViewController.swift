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
    
    let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let addItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = CGColor.init(red: 100, green: 100, blue: 100, alpha: 1)
        button.layer.cornerRadius = 20
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
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = CGColor.init(red: 100, green: 100, blue: 100, alpha: 1)
        textField.textAlignment = .center
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configure(addItemViewModel: AddItemViewModel) {
        self.addItemViewModel = addItemViewModel
    }
    
    @objc func goToListVC() {
        addItemViewModel?.addValue(value: textField.text)
    }

}

private extension AddItemViewController {
    
    func configureUI() {
        view.backgroundColor = .purple
        navigationItem.title = "Add item"
        
        view.addSubview(containerView)
        containerView.addSubview(textField)
        containerView.addSubview(addItemButton)
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.bottom.equalToSuperview().inset(100)
        }
        
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(containerView)
            make.height.equalTo(50)
            make.left.equalTo(containerView).offset(50)
            make.right.equalTo(containerView).offset(-50)
        }
        
        addItemButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerX.equalTo(containerView)
            make.bottom.equalTo(containerView).inset(20)
        }

    }
}
