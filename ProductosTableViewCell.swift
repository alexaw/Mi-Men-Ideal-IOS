//
//  ProductosTableViewCell.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class ProductosTableViewCell: UITableViewCell {
    
    @IBOutlet var nom:UILabel!
    @IBOutlet var ing:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
