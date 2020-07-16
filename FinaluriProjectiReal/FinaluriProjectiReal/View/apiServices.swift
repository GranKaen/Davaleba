//
//  apiServices.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation


class APIService {
    var word = "chicken"
    func searchRecipe(completion: @escaping ([Hit]) -> ()) {
        let urlString = "https://api.edamam.com/search?q=\(word)&app_id=8554fe6e&app_key=c5cd93105d1daf73ec051e5ff9be257e&from=0&to=3&calories=591-722&health=alcohol-free&fbclid=IwAR2V94Opf8svtEOuA6Kw0OhVXDjo0mi3F98LIYXzai18qnxRaXvQQlfazoQ"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Welcome.self, from: data)
                completion(decoded.hits)
            } catch let err {
                print(err.localizedDescription)
                
            }
        }.resume()
    }
}
