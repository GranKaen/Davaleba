//
//  TableViewCell.swift
//  Davaleba folderebis sheqmna
//
//  Created by Kote Ghudushauri on 5/11/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var textciew: UITextView!
    static let identifier = "tableview_id"

    static func nib()->UINib{
        return UINib(nibName: "tableview_id", bundle: nil)
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
