//
//  CellVC.swift
//  Davaleba_animation
//
//  Created by konstantine gudushauri on 5/27/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class CellVC: UITableViewCell {
    @IBOutlet weak var nameoncell: UILabel!
    @IBOutlet weak var imageoncell: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
