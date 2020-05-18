//
//  TableCell.swift
//  davaleba23
//
//  Created by Kote Ghudushauri on 5/18/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var tamelableoncell: UILabel!
    @IBOutlet weak var hexnameoncell: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
