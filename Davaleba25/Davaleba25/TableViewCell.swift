//
//  TableViewCell.swift
//  Davaleba25
//
//  Created by Kote Ghudushauri on 5/20/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var countrylabel: UILabel!
    @IBOutlet weak var capitallabel: UILabel!
    @IBOutlet weak var currencylabel: UILabel!
    @IBOutlet weak var borderslabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
