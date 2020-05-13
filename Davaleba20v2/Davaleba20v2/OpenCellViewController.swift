//
//  OpenCellViewController.swift
//  Davaleba20v2
//
//  Created by Kote Ghudushauri on 5/13/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class OpenCellViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fullTextLabel: UILabel!
    var date: String!
    var fullTitle: String!
    var fullText: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = date
        titleLabel.text = fullTitle
        fullTextLabel.text = fullText
    }

   

}
