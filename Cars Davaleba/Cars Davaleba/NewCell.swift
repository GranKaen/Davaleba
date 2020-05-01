//
//  NewCell.swift
//  Cars Davaleba
//
//  Created by Kote Ghudushauri on 5/1/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class NewCell: UITableViewCell {
    @IBOutlet weak var modelLable: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
