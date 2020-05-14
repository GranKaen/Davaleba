//
//  NoteViewController.swift
//  Davaleba21v3
//
//  Created by Kote Ghudushauri on 5/14/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    var allNote = [Notes]()
    var tempNote: Notes?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    @IBAction func addnotebbutton(_ sender: UIBarButtonItem) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let  VC = storyboard.instantiateViewController(identifier: "addnote_id")
               self.navigationController?.pushViewController(VC, animated: true)
    }
    func fetchUser() {
        let context = AppDelegate.coreDataContainer.viewContext
        
        let request: NSFetchRequest<Notes> = Notes.fetchRequest()
        do {
            let Notes = try context.fetch(request)
            allNote.append(contentsOf: Notes)
        } catch {}
    }
    func deleteNote(note: Notes) {
        let context = AppDelegate.coreDataContainer.viewContext
        context.delete(note)
        
        do {
            try context.save()
        } catch {}
    }
}
extension NoteViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action,view,handler) in
            self.deleteNote(note: self.allNote[indexPath.row])
            self.allNote.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action,view,handler) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let VC = storyboard.instantiateViewController(identifier: "addnote_id") as! addNoteViewController
            self.tempNote = self.allNote[indexPath.row]
            VC.newTempNote = self.tempNote
            VC.EditingMode = true
            self.navigationController?.pushViewController(VC, animated: true)
        }
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        return config
    }
}
extension NoteViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNote.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notecell_id", for: indexPath) as! noteTableViewCell
        cell.tempNote = allNote[indexPath.row]
        return cell
    }
}

