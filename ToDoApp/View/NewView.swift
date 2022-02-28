//
//  NewView.swift
//  ToDoApp
//
//  Created by deniss.lobacs on 25/02/2022.
//

import Foundation
import UIKit

final class NewView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupItems()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Adding new element"
        label.font = label.font.withSize(30)
        label.textColor = .systemOrange
        return label
    }()
    
     let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fillEqually
        return stack
    }()
    
    let productNameTextField = CustomTextField(placeholder: "Input product name:")
    let productCountTextField = CustomTextField(placeholder: "Input product count:")
    
    let addItemButton: UIButton = {
            let button = UIButton(type: .system)
            button.backgroundColor = UIColor.orange
            button.layer.cornerRadius = 15
            button.setTitle("Add", for: UIControl.State.normal)
            button.tintColor = UIColor.white
            return button
        }()
    
}

private extension NewView {
    
    func setupItems() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(addItemButton)
        
        stackView.addArrangedSubview(productNameTextField)
        stackView.addArrangedSubview(productCountTextField)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(30)
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
