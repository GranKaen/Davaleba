//
//  SecondViewController.swift
//  Davaleba43v2
//
//  Created by konstantine gudushauri on 6/18/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var seconbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondImage.image = UIImage(named: "image_1")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scell_id") as! SecondTableViewCell
        cell.lableoncell.text = "baby yoda"
        return cell
    }
}
