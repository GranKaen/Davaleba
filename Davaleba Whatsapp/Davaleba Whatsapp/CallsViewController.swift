//
//  CallsViewController.swift
//  Davaleba Whatsapp
//
//  Created by Kote Ghudushauri on 5/7/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit


class CallsViewController: UIViewController {
    @IBOutlet weak var callstableview: UITableView!
    
    var numbers = ["555123456","555234567","555345678","555456789","555567890"]
    var countries = ["GE","RU","FR","IT","KZ"]
    var dates = ["2/08/1999","2/08/1999","2/08/1999","2/08/1999","2/08/1999"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        callstableview.delegate = self
        callstableview.dataSource = self
    }


    

}
extension CallsViewController: UITableViewDelegate{
    
}
extension CallsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "callscell_id", for: indexPath) as! CallsCell
        cell.countrylable.text = countries[indexPath.row]
        cell.numberLable.text = numbers[indexPath.row]
        cell.datelable.text = dates[indexPath.row]
        return cell
        
    }
    
    
}
