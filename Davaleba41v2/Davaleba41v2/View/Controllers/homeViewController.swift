//
//  homeViewController.swift
//  Davaleba41v2
//
//  Created by konstantine gudushauri on 6/15/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

typealias TableViewNeccessities = UITableViewDelegate & UITableViewDataSource

class homeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let coffees = CoffeesModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

