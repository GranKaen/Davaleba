//
//  addpage.swift
//  Davaleba 18v2
//
//  Created by Kote Ghudushauri on 5/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
protocol foradd{
    func addtext(text : String)
}

class addpage: UIViewController {
    
    
    var delegate1: foradd?
    
    @IBOutlet weak var addtexttextview: UITextView!
    @IBOutlet weak var addtextnametextfield: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addbutton(_ sender: UIButton) {
        
        
        let addtextcontent = addtexttextview.text ?? ""
        let addtextname = addtextnametextfield.text ?? ""
        let filem = FileManager.default
        let mainUrl = try! filem.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        do{
            try addtextcontent.write(to: mainUrl.appendingPathComponent("\(addtextname).txt"), atomically: true, encoding: .utf8)
        }
        catch {
            
        }
        self.delegate1?.addtext(text: addtextcontent)
        addtexttextview.text = ""
        addtextnametextfield.text = ""
    }
    
    

}
