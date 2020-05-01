//
//  ViewController.swift
//  Cars Davaleba
//
//  Created by Kote Ghudushauri on 5/1/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GetCar {
    
    @IBOutlet weak var tableview: UITableView!
    
    var Cars = [Car]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
    }
    

    override func viewDidAppear(_ animated: Bool) {
        tableview.setContentOffset(.zero, animated: true)
        
    }
    
    func NewCar(vehicle: Car) {
    Cars.append(vehicle)
    tableview.reloadData()
    }
        
    @IBAction func gotosecondpage(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SecondPage = storyboard.instantiateViewController(withIdentifier: "MeorePage_id")
        if let unWrappedSecondPage = SecondPage as? MeorePageVC{
            unWrappedSecondPage.pipia = self
        }
        self.navigationController?.pushViewController(SecondPage, animated: true)
        
    }
    @IBAction func ScrollUp(_ sender: UIButton) {
        tableview.setContentOffset(.zero, animated: true)
        
    }
    @IBAction func ScrollDows(_ sender: UIButton) {
        if(Cars.count==0){return}
        let indexPath = IndexPath(row: Cars.count-1, section: 0)
        tableview.scrollToRow(at: indexPath, at: .bottom, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell_id", for: indexPath) as! NewCell
        cell.modelLable.text = "Model: \(Cars[indexPath.row].model)"
        cell.priceLable.text = "Price: \(Cars[indexPath.row].price) $"
        cell.carImage.image = UIImage(named: Cars[indexPath.row].picture)
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate{
    
}

