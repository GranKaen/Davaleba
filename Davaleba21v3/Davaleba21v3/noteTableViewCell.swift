//
//  noteTableViewCell.swift
//  Davaleba21v3
//
//  Created by Kote Ghudushauri on 5/14/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class noteTableViewCell: UITableViewCell {
    @IBOutlet weak var celllable: UILabel!
    var tempNote: Notes! {
        didSet {
            celllable.text = tempNote.note
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
