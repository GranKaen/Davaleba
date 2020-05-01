//
//  MeorePageVC.swift
//  Cars Davaleba
//
//  Created by Kote Ghudushauri on 5/1/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
protocol GetCar {
    func NewCar(vehicle:Car)
}
class MeorePageVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var modeltextfield: UITextField!
    @IBOutlet weak var pricetextfield: UITextField!
    
    var pipia: GetCar?
    var pictures = ["BMW","FIAT"]
    var picture:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddSmile(_ sender: UIButton) {
        let model = modeltextfield.text ?? ""
        let price = Double(pricetextfield.text!) ?? 0
        let axali = Car(model: model,price:price, picture: self.picture ?? "Lambo")
        pipia?.NewCar(vehicle: axali)
    }
    
   

    
    
    
}
extension MeorePageVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row==0 {
            
            self.picture="BMW"
            
        }
        else{
            picture="FIAT"
            
        }
    
    }
}
extension MeorePageVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell_id") as! SecondViewCell
        cell.SecondImage.image = UIImage(named: pictures[indexPath.row])
        
        return cell
        
    }
    
    
}

