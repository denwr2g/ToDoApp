//
//  TableCell.swift
//  ToDoApp
//
//  Created by deniss.lobacs on 17/02/2022.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    
    func set(product: Product) {
        self.productNameLabel.text = product.productName
        self.productCountLabel.text = product.productCount
    }
}
