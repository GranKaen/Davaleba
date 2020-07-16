//
//  MyRecipesViewController.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

protocol ArticlePageDelegate {
    func getArticleIndex(index: Int)
}

class MyRecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var myTableView: UITableView!
    
    var recipe = [Recipes]()
    
    var delegate: ArticlePageDelegate?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        fetchPosts()
        notification()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchPosts()
    }
    
    func notification(){
        
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Food Time"
        content.subtitle = "Prepare"
        content.body = "Lets make some food"
        content.sound = UNNotificationSound.default
        content.threadIdentifier = "local-notifications temp"

        let date = Date(timeIntervalSinceNow: 30)
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "firstnotifiqation_id", content: content, trigger: trigger)
        center.add(request){ (error) in
            if error != nil{
                print(error ?? "")
            }
            
        }
        
    }
    
    
    private func fetchPosts() {
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Recipes> = Recipes.fetchRequest()
        
        do {
            let posts = try context.fetch(request)
            self.recipe.removeAll()
            self.recipe.append(contentsOf: posts)
            myTableView.reloadData()
    
        } catch {}
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: "my_recipe_cell", for: indexPath) as! myrecipeTableViewCell
              
              cell.recip = recipe[indexPath.row]
              
              
              return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = self.tabBarController as? MainViewController
        
        let seepostVC = storyboard?.instantiateViewController(identifier: "show_recipe") as! showrecipeViewController
        seepostVC.recip = recipe[indexPath.row]
        
        navigationController?.pushViewController(seepostVC, animated:true)
    }
    
    
    func tableView(_ articlesTable: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            print("Tapped on delete")
            
            self.recipe.remove(at: indexPath.row)
            articlesTable.deleteRows(at: [indexPath], with: .left)
            
            handler(true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete])
        
        
        return config
    }
    
    
    

    @IBAction func onAddButton(_ sender: UIBarButtonItem) {
        
        
        let addPostVC = storyboard?.instantiateViewController(identifier: "add_recipe") as! addrecipeViewController
        
        navigationController?.pushViewController(addPostVC, animated: true)
        
        
        
    }
    

}

