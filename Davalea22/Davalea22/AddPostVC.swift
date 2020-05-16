//
//  AddPostVC.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/16/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import CoreData

class AddPostVC: UIViewController {
    var user: User?
    
    @IBOutlet weak var postcontent: UITextView!
    
    @IBOutlet weak var postdate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func publishPost() {
        let context = AppDelegate.viewContext
        let post = Post(context: context)
        
        post.content = postcontent.text
        post.date = postdate.date
        post.user = user
        do {
            try context.save()
        } catch {}
    }
    

    @IBAction func addpostaddpostpage(_ sender: UIButton) {
        
        publishPost()
        navigationController?.popViewController(animated: true)
    }
    

}
