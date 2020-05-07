//
//  SettingsViewController.swift
//  Davaleba Whatsapp
//
//  Created by Kote Ghudushauri on 5/7/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingstableview: UITableView!
    
    var settings = ["change name","change password","log out","change mail","change something just need fifth element to ctrl+v"]
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingstableview.delegate = self
        settingstableview.dataSource = self
        
        
        
    }
    

   

}
extension SettingsViewController: UITableViewDelegate{
    
}
extension SettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingscell_id", for: indexPath) as! SettingsCell
        cell.settingslable.text = settings[indexPath.row]
        
        return cell
        
    }
    
    
}
