//
//  ViewController.swift
//  Davaleba 12v1
//
//  Created by Kote Ghudushauri on 4/30/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

protocol AddNewsdelegate {
func getsomedatafromthere(text: String)
}
class ViewController: UIViewController, AddNewsdelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var newses = [News]()
    
    
    @IBAction func ScrollUpButton(_ sender: UIBarButtonItem) {
        tableView.SetContentOffset(.zero, animated:true)
    }
    
    @IBAction func AddBarB(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addVC = storyBoard.instantiateViewController(withIdentifier: "add_vc")
        
        if let unwrapedVC = addVC as? AddViewController{
        unwrapedVC.delegate = self
        unwrapedVC.newsList = self.newses
            
        }
        
        self.navigationController?.show(addVC, sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    func getsomedatafromthere(text: String) {
        print(text)
    }
    
    
    
    
    
    
    
    
}

extension ViewController: UITableViewDelegate{
    
}
//Mark - CHACKPOINT
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newe_id", for: indexPath) as! NewsTableViewCell
        
        var news = self.newses[indexPath.row]
        
        
        news.title = cell.titleLable.text ?? ""
        news.content = cell.contentlable.text ?? ""
        
        return cell
    }
    
    
}


