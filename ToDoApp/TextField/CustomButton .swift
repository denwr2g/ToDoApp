//
//  CustomTextField.swift
//  ToDoApp
//
//  Created by deniss.lobacs on 25/02/2022.
//

import Foundation
import UIKit


 class CustomButton: UIButton {
    
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
        
     }

}
