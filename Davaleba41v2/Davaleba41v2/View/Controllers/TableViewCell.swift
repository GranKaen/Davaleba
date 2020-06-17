//
//  TableViewCell.swift
//  Davaleba41v2
//
//  Created by konstantine gudushauri on 6/16/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var coffeimage: UIImageView!
    
    @IBOutlet weak var coffename: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
