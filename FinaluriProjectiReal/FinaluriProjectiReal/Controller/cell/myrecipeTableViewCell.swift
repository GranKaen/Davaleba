//
//  myrecipeTableViewCell.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class myrecipeTableViewCell: UITableViewCell {
    @IBOutlet var myImageOnCell: UIImageView!{
        didSet{
            myImageOnCell.layer.cornerRadius = myImageOnCell.frame.height/2
        }
    }
    @IBOutlet var myLabelOnCell: UILabel!
    
    
    var recip: Recipes! {
        didSet {
            myLabelOnCell.text = recip.recipeName
            if (recip?.recipeImage) != nil {
                myImageOnCell.image = UIImage(data: (recip?.recipeImage)!)
            }
            
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
