//
//  NewsTableViewCell.swift
//  Davaleba 12v1
//
//  Created by Kote Ghudushauri on 4/30/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var contentlable: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
