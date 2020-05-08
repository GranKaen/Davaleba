//
//  ViewController.swift
//  Davaleba 18v2
//
//  Created by Kote Ghudushauri on 5/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ViewController: UIViewController, foradd, foredit {
    
    

    @IBOutlet weak var tableview: UITableView!
    
    var array = [String]()
    var index = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }

    @IBAction func addbarbutton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let AddtextVC = storyboard.instantiateViewController(withIdentifier: "add_id")
        if let unwrappedVC = AddtextVC as? addpage{
            unwrappedVC.delegate1 = self
        }
        
        self.navigationController?.pushViewController(AddtextVC, animated: true)
        
    }
    
    func addtext(text: String) {
        array.append(text)
        tableview.reloadData()
    }
    
    func editedtext(text: String) {
        array[index] = text
        tableview.reloadData()
    }
    

}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view, handler) in
            self.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            handler(true)
        }
        let edit = UIContextualAction(style: .normal, title: "Edit"){ (actiib, view, handler) in
            self.index = indexPath.row
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let EditVC = storyboard.instantiateViewController(withIdentifier: "edit_id")
            if let unwrappedVC = EditVC as? editpage{
                unwrappedVC.shouldedit = self.array[indexPath.row]
                unwrappedVC.delegate2 = self
            }
            self.navigationController?.pushViewController(EditVC, animated: true)
        }
        edit.backgroundColor = .systemIndigo
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        
        return config
    }
    }
    
    

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstpagecell_id") as! TableViewCell
        cell.sorttext.text = array[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fulltextVC = storyboard.instantiateViewController(withIdentifier: "view_id")
        
        if let unwrappedVC = fulltextVC as? viewpage{
            unwrappedVC.textforfull = array[indexPath.row]
        }
        self.navigationController?.pushViewController(fulltextVC, animated: true)
    }
    
}
