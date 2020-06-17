//
//  HomeModelView.swift
//  Davaleba41v2
//
//  Created by konstantine gudushauri on 6/17/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
import UIKit

extension homeViewController: TableViewNeccessities {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "full_id") as! FullViewController
        
        VC.tempImage = coffees.coffees[indexPath.row]
        VC.tempName = coffees.coffees[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coffees.coffees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! TableViewCell
        
        cell.coffeimage.image = UIImage(named: coffees.coffees[indexPath.row])
        cell.coffename.text = coffees.coffees[indexPath.row]
        
        return cell
    }
    
    
}
