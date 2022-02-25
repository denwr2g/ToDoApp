//
//  CustomTextField.swift
//  ToDoApp
//
//  Created by deniss.lobacs on 25/02/2022.
//

import Foundation
import UIKit


 class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(placeholder: String) {
        super.init(frame: .zero)
        settingsUI(placeholder: placeholder)
     }
     
    private func settingsUI(placeholder: String) {
         font = UIFont(name: "Arial", size: 14)
         attributedPlaceholder = NSAttributedString(
             string: placeholder,
             attributes: [.foregroundColor : UIColor.lightGray,
                          .font            : UIFont.systemFont(ofSize: 12)])
         textColor = .black
         layer.borderWidth = 1
         layer.cornerRadius = 10
         layer.borderColor = UIColor.systemOrange.cgColor
         layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
         textAlignment = .left
     }

}
