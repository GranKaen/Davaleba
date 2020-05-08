//
//  editpage.swift
//  Davaleba 18v2
//
//  Created by Kote Ghudushauri on 5/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
protocol foredit{
    func editedtext(text : String)
}
class editpage: UIViewController {

    var delegate2: foredit?
    var shouldedit: String?
    
    @IBOutlet weak var edittexttextview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        edittexttextview.text = shouldedit
    }
    

    @IBAction func editbutton(_ sender: UIButton) {
        let editedtext = edittexttextview.text ?? ""
        self.delegate2?.editedtext(text: editedtext)
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
   func readText(url: URL) -> String {
       return try! String(contentsOf: url)
   }
}
