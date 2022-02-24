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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Adding new element"
        label.font = label.font.withSize(30)
        label.textColor = .systemOrange
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let productNameTextField = UITextField.customTextField("Input Product Name:")
    private let productCountTextField = UITextField.customTextField("Input Product Count:")
    
    private let addItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.setTitle("Add", for: UIControl.State.normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(goToListVC), for: .touchUpInside)
       return button
    }()
    
    
    func configure(addItemViewModel: AddItemViewModel) {
        self.addItemViewModel = addItemViewModel
    }
    
    @objc func goToListVC() {
        addItemViewModel?.addValue(productName: productNameTextField.text, productCount: productCountTextField.text)
    }
}

private extension AddItemViewController {

    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Add item"
        
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(addItemButton)
        
        stackView.addArrangedSubview(productNameTextField)
        stackView.addArrangedSubview(productCountTextField)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).inset(70)
            make.left.right.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        productNameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        productCountTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        addItemButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(30)
            make.left.right.equalToSuperview().inset(30)
            make.centerX.equalTo(stackView)
        }


    }
}
