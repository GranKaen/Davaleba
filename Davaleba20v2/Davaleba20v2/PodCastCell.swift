//
//  PodCastCell.swift
//  Davaleba20v2
//
//  Created by Kote Ghudushauri on 5/13/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class PodCastCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var smallTextLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
