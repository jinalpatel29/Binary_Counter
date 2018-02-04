//
//  CustomCell.swift
//  Custom_Cell
//
//  Created by Dojo on 1/17/18.
//  Copyright © 2018 Dojo. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var delegate: CustomCellDelegate?
    @IBOutlet weak var unitLabelText: UILabel!
    
    @IBAction func minusButton(_ sender: UIButton) {
        delegate?.buttonPressedDelegate(cell: self, increment: false)
    }
    @IBAction func plusButton(_ sender: UIButton) {
        delegate?.buttonPressedDelegate(cell: self, increment: true)
    }

    
}
