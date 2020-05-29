//
//  ViewController.swift
//  DevExc
//
//  Created by konstantine gudushauri on 5/27/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit
import CoreData

struct QuoteResponse: Codable {
    let text: String
    enum CodingKeys: String, CodingKey {
        case text
    }
}
class ViewController: UIViewController {
    @IBOutlet weak var Exclabel: UILabel!
    
    var excuse: String?
    var favexcuses = [FavoriteExcuses]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getexcuse()
        // Do any additional setup after loading the view.
    }
    
    func getexcuse() {
        let url = URL(string: "http://dev-excuses-api.herokuapp.com")!
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let quoteResponse = try decoder.decode(QuoteResponse.self, from: data)
                
                self.excuse = quoteResponse.text
            } catch {print(error.localizedDescription)}
            
        }.resume()
    
    }
    
    func saveexc() {
        let context = AppDelegate.viewContext
        let result = FavoriteExcuses(context: context)
        
        result.text = "\(Exclabel.text ?? "")"
        favexcuses.append(result)
        do {
            try context.save()
        } catch {}
    }
   
    
    @IBAction func getexcbutton(_ sender: UIButton) {
        getexcuse()
        Exclabel.text = excuse ?? "chemi brali araa api chedavs daspame buttoni :D"
        
        
        
    }
    @IBAction func addtofavbutton(_ sender: UIButton) {
        saveexc()
    }
    

}

