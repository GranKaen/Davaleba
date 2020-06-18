//
//  ViewController.swift
//  Davaleba43v2
//
//  Created by konstantine gudushauri on 6/17/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    var models = [Model]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        models.append(Model(text: "Baby yoda", imageName: "image_1"))
        models.append(Model(text: "Red panda", imageName: "image_2"))
        models.append(Model(text: "cat", imageName: "image_3"))
        models.append(Model(text: "dog", imageName: "image_4"))
        models.append(Model(text: "Baby yoda", imageName: "image_1"))
        models.append(Model(text: "Red panda", imageName: "image_2"))
        models.append(Model(text: "cat", imageName: "image_3"))
        models.append(Model(text: "dog", imageName: "image_4"))
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.configure(with: models)
        cell.labelontcell.text = "Some Text"
        cell.didSelectItemAction = { [weak self] indexPath in
           
           let detailVC = self?.storyboard?.instantiateViewController(identifier: "second_id") as! SecondViewController
            let image: UIImage = UIImage(named: cell.models[indexPath.row].imageName)!
            detailVC.secondImage = UIImageView(image: image)
           self?.navigationController?.pushViewController(detailVC, animated: true)
       }
       return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    
    }
    
    
        
    
    
}
struct Model {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String){
        self.text = text
        self.imageName = imageName
    }
    
}
