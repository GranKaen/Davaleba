//
//  AddFolderViewController.swift
//  Davaleba folderebis sheqmna
//
//  Created by Kote Ghudushauri on 5/11/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
protocol passDataToFirst {
    func passDirectory(folder:String)
}

class AddFolderViewController: UIViewController {

    @IBOutlet weak var addfoldername: UITextField!
    var directoryProtocol: passDataToFirst?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addfolder(_ sender: UIButton) {
        
        let folder = addfoldername.text ?? ""
        directoryProtocol?.passDirectory(folder: folder)
        
    }
    

}
