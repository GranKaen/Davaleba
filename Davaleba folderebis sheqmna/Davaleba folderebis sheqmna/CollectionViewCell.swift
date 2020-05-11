//
//  CollectionViewCell.swift
//  Davaleba folderebis sheqmna
//
//  Created by Kote Ghudushauri on 5/11/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var Foldername: UILabel!
    
    static let identifier = "collectionviewcell_id"
    
    static func nib()-> UINib{
        return UINib(nibName: "collectionviewcell_id", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
