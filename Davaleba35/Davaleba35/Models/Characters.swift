//
//  Characters.swift
//  Davaleba35
//
//  Created by konstantine gudushauri on 6/8/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation

struct Location: Codable {
    let name: String
}
struct Character: Codable {
    let name, status, species: String
    let gender: String
    let origin: Location
    let image: String
}
