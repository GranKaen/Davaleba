//
//  CharacterResponse.swift
//  Davaleba35
//
//  Created by konstantine gudushauri on 6/7/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation

struct CharactersResponse : Codable{
    let characters : [Character]
    
    enum CodingKeys : String, CodingKey{
        case characters = "results"
    }
}
