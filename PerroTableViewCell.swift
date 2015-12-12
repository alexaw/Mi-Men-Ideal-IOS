//
//  PerroTableViewCell.swift
//  MiMenuIdeal
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class PerroTableViewCell: UITableViewCell {
    
    //me representa al view de la celda
    //no representa al objeto de informacion
    //a traves de esta clase lleno la informacion
    @IBOutlet var title:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
