//
//  UITextFieldExtension.swift
//  ToDoApp
//
//  Created by deniss.lobacs on 24/02/2022.
//

import UIKit

extension UITextField {
    static func customTextField(_ placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont(name: "Arial", size: 14)
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor : UIColor.lightGray,
                         .font            : UIFont.systemFont(ofSize: 12)])
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemOrange.cgColor
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        textField.textAlignment = .left
        return textField
    }
}
