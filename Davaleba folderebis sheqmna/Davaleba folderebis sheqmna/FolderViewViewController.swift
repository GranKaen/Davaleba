//
//  FolderViewViewController.swift
//  Davaleba folderebis sheqmna
//
//  Created by Kote Ghudushauri on 5/11/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class FolderViewViewController: UIViewController {
    var folderName: String?
    @IBOutlet weak var tableview: UITableView!
    
    var filmanager = CustomFileManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        tableview.reloadData()
    }
    

    @IBAction func addfile(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let addFilePage = storyboard.instantiateViewController(withIdentifier: "addfile_id") as! AddFileViewController
            addFilePage.folder = folderName ?? ""
            
            self.navigationController?.pushViewController(addFilePage, animated: true)
        }
}
extension FolderViewViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var arrayOfFiles = filmanager.contentsOfURL(url: filmanager.filePath(name: folderName ?? ""))
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            self.filmanager.removeFile(url: arrayOfFiles[indexPath.row])
            tableView.reloadData()
            print(arrayOfFiles[indexPath.row].lastPathComponent)
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let addFilePage = storyboard.instantiateViewController(withIdentifier: "addfile_id") as! AddFileViewController
            let arrayOfFiles = self.filmanager.contentsOfURL(url: self.filmanager.filePath(name: self.folderName ?? ""))
            addFilePage.folder = self.folderName ?? ""
            addFilePage.fileToEdit = arrayOfFiles[indexPath.row].lastPathComponent
            
            self.navigationController?.pushViewController(addFilePage, animated: true)
            
        }
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
    
}
extension FolderViewViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let folderPath = folderName ?? ""
        
            let arrayOfFiles = filmanager.contentsOfURL(url: filmanager.filePath(name: folderPath))
            return arrayOfFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let folderPath = folderName ?? ""
        let arrayOfFiles = filmanager.contentsOfURL(url: filmanager.filePath(name: folderPath))
        
        cell.textciew.text = try! String(contentsOf: arrayOfFiles[indexPath.row], encoding: .utf8)
            
        return cell
    }
    
    
}
