//
//  ViewController.swift
//  Davaleba20v2
//
//  Created by Kote Ghudushauri on 5/13/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, filterProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var allPodCasts = [Item]()
       var filter: String?
       var selectedRow = 0
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           tableView.delegate = self
           tableView.dataSource = self
       }
       override func viewWillAppear(_ animated: Bool) {
           fetch()
           tableView.reloadData()
       }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let id = segue.identifier, id == "filter_id" {
               if let filterVC = segue.destination as? FilterViewController{
                   filterVC.delegate = self
               }
           }
           
           if let id = segue.identifier, id == "show_cell_id" {
               if let fullCellVC = segue.destination as? OpenCellViewController{
                   fullCellVC.date = allPodCasts[selectedRow].date
                   fullCellVC.fullText = allPodCasts[selectedRow].text
                   fullCellVC.fullTitle = allPodCasts[selectedRow].title
               }
           }
       }
       
       func onFilter(date: String) {
           filter = date
           
       }
   }

   extension ViewController: UITableViewDelegate{
       
   }

   extension ViewController: UITableViewDataSource {
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           allPodCasts.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "padcast_cell_id", for: indexPath) as! PodCastCell
           cell.titleLabel.text = allPodCasts[indexPath.row].title
           cell.smallTextLabel.text = allPodCasts[indexPath.row].text
           cell.dataLabel.text = allPodCasts[indexPath.row].date
           return cell
       }
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           selectedRow = indexPath.row
           performSegue(withIdentifier: "show_cell_id", sender: self)
       }
   }
   extension ViewController {
       func fetch(){
           allPodCasts.removeAll()
           let container = AppDelegate.coreDataContainer
           
           let context = container.viewContext
           
           let fetcRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PodCast")
           
           if let _ = filter {
               fetcRequest.predicate = NSPredicate(format: "time > \(filter!)")
           }
           
           do {
               let result = try context.fetch(fetcRequest)
               
               guard let data = result as? [NSManagedObject] else {return}
               
               for item in data {
                   if let p = item as? PodCast {
                       let newPodcast = Item(title: p.title!, text: p.text!, date: p.time!)
                       allPodCasts.append(newPodcast)
                   }
               }
           } catch {}
       }
   }
   struct Item {
       var title: String
       var text: String
       var date: String
   }



