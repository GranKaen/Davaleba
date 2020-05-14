//
//  addNoteViewController.swift
//  Davaleba21v3
//
//  Created by Kote Ghudushauri on 5/14/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData
class addNoteViewController: UIViewController {
    @IBOutlet weak var addnotefield: UITextField!
    var newTempNote: Notes?
    var EditingMode = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addnotefield.text = newTempNote?.note
    }
    @IBAction func addnotebutton(_ sender: Any) {
        if EditingMode {
            updateNote()
        } else {
            saveNote()
        }
        self.navigationController?.popViewController(animated: true)
    }
     func saveNote() {
               let context = AppDelegate.coreDataContainer.viewContext
               let notes = Notes(context: context)
               let tempUser = User(context: context)
               notes.note = addnotefield.text!
               tempUser.userNotes = notes
               do {
                   try context.save()
               } catch {}
            }
       func updateNote() {
           let context = AppDelegate.coreDataContainer.viewContext
           newTempNote?.note = addnotefield.text!
           do {
               try context.save()
           } catch {}
       }
}
