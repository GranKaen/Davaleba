//
//  SecondVC.swift
//  DevExc
//
//  Created by konstantine gudushauri on 5/28/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import CoreData
class SecondVC: UIViewController {
     var favexcuses = [FavoriteExcuses]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        fetchexcuse()
    
    }
    
    func fetchexcuse() {
        
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<FavoriteExcuses> = FavoriteExcuses.fetchRequest()
        
        do {
            let results = try context.fetch(request)
            self.favexcuses.removeAll()
            self.favexcuses.append(contentsOf: results)

        } catch {}
        
    }
    

}
extension SecondVC: UITableViewDelegate{
    
}
extension SecondVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favexcuses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = favexcuses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as! FavexcusesCell
        cell.labeloncell.text = result.text
        return cell
    }
    
    
}
