//
//  TableViewCell.swift
//  Davaleba 18v2
//
//  Created by Kote Ghudushauri on 5/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var sorttext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
