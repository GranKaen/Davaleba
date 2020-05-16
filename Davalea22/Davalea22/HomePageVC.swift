//
//  HomePageVC.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/16/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class HomePageVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchPosts()
        navigationController?.isNavigationBarHidden = false
    }
    
    private func fetchPosts() {
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Post> = Post.fetchRequest()
        
        do {
            let posts = try context.fetch(request)
            self.posts.removeAll()
            self.posts.append(contentsOf: posts)
            tableView.reloadData()
    
        } catch {}
    }
    
    
    
    @IBAction func addpost(_ sender: UIButton) {
        
        let tabBar = self.tabBarController as? TabBarController
        let user = tabBar?.user
        let addPostVC = storyboard?.instantiateViewController(identifier: "addpost_id") as! AddPostVC
        addPostVC.user = user
        navigationController?.pushViewController(addPostVC, animated: true)
        
    }
    
    

}
extension HomePageVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homecell_id", for: indexPath) as! HomeCellVC
        
        cell.post = posts[indexPath.row]
        
        return cell
        
    }
    
    
}
extension HomePageVC: UITableViewDelegate {
    
}
