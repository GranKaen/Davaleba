//
//  AddViewController.swift
//  Davaleba 12v1
//
//  Created by Kote Ghudushauri on 4/30/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit



class AddViewController: UIViewController {
    
    @IBOutlet weak var TitleField: UITextField!
    @IBOutlet weak var ContentTextView: UITextView!
    
    var newsList = [News]()
    
    var delegate: AddNewsdelegate?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onAddButtonTapped(_ sender: UIButton) {
        
        let title = TitleField.text ?? ""
        let content = ContentTextView.text ?? ""
        
        let news = News(title: title, content: content)
        newsList.append(news)
        
        
        print("\(newsList.count)")
    }
    private func     clearfields(){
        TitleField.text = ""
        ContentTextView.text = ""
    }

}
struct News{
    var title: String
    var content: String
}
