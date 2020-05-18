//
//  secondVC.swift
//  davaleba23
//
//  Created by Kote Ghudushauri on 5/18/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

struct JokeResponse: Codable {
    let jokes: String
    enum CodingKeys: String, CodingKey {
        case jokes = "value"
    }
}



class secondVC: UIViewController {

    @IBOutlet weak var RealManLable: UILabel!
    @IBOutlet weak var Jokelabel: UILabel!
    
    var joke: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJoke()
        // Do any additional setup after loading the view.
    }
    
    func getJoke() {
           let url = URL(string: "https://api.chucknorris.io/jokes/random?category=dev")!
           URLSession.shared.dataTask(with: url) { (data, res, err) in
               
               guard let data = data else {return}
               
               do {
                   let decoder = JSONDecoder()
                   let jokeResponse = try decoder.decode(JokeResponse.self, from: data)
                   
                   self.joke = jokeResponse.jokes
               } catch {print(error.localizedDescription)}
               
           }.resume()
       
       }

    @IBAction func getjoke(_ sender: Any) {
        Jokelabel.text = joke ?? "araferi"
        getJoke()
        RealManLable.text = "Real Chuck Norris fan Will never follow the rules"
        
    }
}
