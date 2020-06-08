//
//  TableVC.swift
//  Davaleba35
//
//  Created by konstantine gudushauri on 6/7/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import SkeletonView

class TableVC: UITableViewCell {
    @IBOutlet weak var imageoncell: UIImageView!
    @IBOutlet weak var nameoncell: UILabel!
    @IBOutlet weak var nicknameoncell: UILabel!
    @IBOutlet weak var birthdayoncell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
