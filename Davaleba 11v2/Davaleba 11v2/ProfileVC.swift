//
//  ProfileVC.swift
//  Davaleba 11v2
//
//  Created by Kote Ghudushauri on 4/29/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    

    var Prople = [ViewController.register]()
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
        }

        

}


    extension ProfileVC: UITableViewDelegate{
        
    }
    extension ProfileVC: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Prople.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = " \(Prople[indexPath.row].namelet) "
            return cell!
        }
        
            
                }

