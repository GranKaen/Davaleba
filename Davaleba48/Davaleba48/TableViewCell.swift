//
//  TableViewCell.swift
//  Davaleba48
//
//  Created by konstantine gudushauri on 6/26/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
        
        var model: Model?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            coverImageView.layer.cornerRadius = 40
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
        }
        
        func displayData(){
            guard let data = model else {return}
            coverImageView.image    = UIImage(named: data.imageName)
            descriptionLabel.text   = ""
            descriptionLabel.textColor  = .red
            descriptionLabel.textAlignment  = .center
        }
        
        func displayDescription(){
            guard let currentData = model else {return}
            descriptionLabel.textColor      = .black
            descriptionLabel.text           = currentData.description
            descriptionLabel.textAlignment  = .left
        }

    }

