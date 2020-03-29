//
//  ItemCell.swift
//  Homepwner
//
//  Created by Michael Guay on 3/28/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//  221

import UIKit

class ItemCell : UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.adjustsFontForContentSizeCategory = true
        idLabel.adjustsFontForContentSizeCategory = true

    }
}
