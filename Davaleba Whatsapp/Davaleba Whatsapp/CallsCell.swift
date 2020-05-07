//
//  CallsCell.swift
//  Davaleba Whatsapp
//
//  Created by Kote Ghudushauri on 5/7/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class CallsCell: UITableViewCell {
    
    @IBOutlet weak var numberLable: UILabel!
    @IBOutlet weak var countrylable: UILabel!
    @IBOutlet weak var datelable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
