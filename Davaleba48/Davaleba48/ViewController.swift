//
//  ViewController.swift
//  Davaleba48
//
//  Created by konstantine gudushauri on 6/26/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
        var model = [Model]()
        
        override var preferredStatusBarStyle: UIStatusBarStyle{
            return .lightContent
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupDataTable()
        }
        
        func setupDataTable(){
            tableView.delegate                  = self
            tableView.dataSource                = self
            tableView.allowsMultipleSelection   = true
            tableView.isSpringLoaded            = true
            fillData()
        }

        func fillData(){
            for _ in Range(1...5){
                model.append(Model(imageName: "image", description: "this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square,this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square,this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square,this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square, this is Green Square," ))
            }
        }

    }



    extension ViewController: UITableViewDelegate, UITableViewDataSource{
        
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id") as! TableViewCell
            
            cell.model = model[indexPath.row]
            cell.displayData()
            if let selection = cell.model!.isSelected{
                if selection {
                    cell.displayDescription()
                }
            }
            
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else {return}
            
            model[indexPath.row].isSelected = true
            
            tableView.beginUpdates()
            cell.displayDescription()
            tableView.endUpdates()
        }
        
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            
            model[indexPath.row].isSelected = false
            
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .none)
            tableView.endUpdates()
        }
        
    }
