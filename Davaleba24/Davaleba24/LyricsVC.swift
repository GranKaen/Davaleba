//
//  LyricsVC.swift
//  Davaleba24
//
//  Created by Kote Ghudushauri on 5/19/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
struct LyricResponse: Codable {
    let lyrics : String
}
class LyricsVC: UIViewController {
    @IBOutlet weak var lyricstext: UILabel!
    var songaddress = ""
    var songlyrics = ""
    
        override func viewDidLoad() {
        super.viewDidLoad()
            fetchUsersList()
        // Do any additional setup after loading the view.
    }
    
    func fetchUsersList() {
          let newString = songaddress.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
          guard let url = URL(string: "https://api.lyrics.ovh/v1/\(newString)") else {return}
          var urlRequest = URLRequest(url: url)
          urlRequest.httpMethod = "GET"
          
          URLSession.shared.dataTask(with: urlRequest) { (data, res, err) in
              
              guard let data = data else {return}
              
              do {
                  let decoder = JSONDecoder()
                  let songResponse = try decoder.decode(LyricResponse.self, from: data)
                  
                  self.songlyrics = songResponse.lyrics
                  DispatchQueue.main.async {
                      self.lyricstext.text = self.songlyrics
                  }
              } catch {print(error.localizedDescription)}
              
          }.resume()
          
      }
}
