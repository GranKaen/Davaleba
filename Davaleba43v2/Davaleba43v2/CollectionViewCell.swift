//
//  CollectionViewCell.swift
//  Davaleba43v2
//
//  Created by konstantine gudushauri on 6/17/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet var labelView: UIView!
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    static let identifier = "ccell_id"
    
    
    static func nib() -> UINib{
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: Model){
        self.myLabel.text = model.text
        self.myImage.image = UIImage(named: model.imageName)
    }
}
