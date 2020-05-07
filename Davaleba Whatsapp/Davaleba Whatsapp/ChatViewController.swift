//
//  ChatViewController.swift
//  Davaleba Whatsapp
//
//  Created by Kote Ghudushauri on 5/7/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, getmessage {
    
    
    @IBOutlet weak var chattableview: UITableView!
    
    var messagearray = [message]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chattableview.delegate = self
        chattableview.dataSource = self
        
    }
    
    @IBAction func addchatbutton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addtochatpage = storyboard.instantiateViewController(withIdentifier: "addtochat_id")
        
        if let unWrappedMeorePage = addtochatpage as? addtochatViewController{
            unWrappedMeorePage.messagedelegate = self
        }
        
        self.navigationController?.pushViewController(addtochatpage, animated: true)
   
   
}
    
    func newmessage(message: message) {
        messagearray.append(message)
        chattableview.reloadData()
    }
}
extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addtochatpage = storyboard.instantiateViewController(withIdentifier: "addtochat_id")
        if let unWrappedMeorePage = addtochatpage as? addtochatViewController{
        unWrappedMeorePage.messagedelegate = self
        }
        self.navigationController?.pushViewController(addtochatpage, animated: true)
    }
}
extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagearray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatcell_id", for: indexPath) as! ChatCell
        cell.namecelllable.text = "Name: \(messagearray[indexPath.row].name)"
        cell.textcelllable.text = "Short text: \(messagearray[indexPath.row].atext) "
        cell.imagecell.image = UIImage(named: "rame")
        
        return cell
    }
    
    
}
