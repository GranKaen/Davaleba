//
//  homeViewController.swift
//  Davaleba41v2
//
//  Created by konstantine gudushauri on 6/15/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let AllCoffe = ["Espresso","Cappuccino","macciato","Mocha","latte"]

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
extension homeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "full_id") as! FullViewController
        
        VC.tempImage = AllCoffe[indexPath.row]
        VC.tempName = AllCoffe[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
extension homeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AllCoffe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath) as! TableViewCell
        
        cell.coffeimage.image = UIImage(named: AllCoffe[indexPath.row])
        cell.coffename.text = AllCoffe[indexPath.row]
        
        return cell
    }
    
    
}
