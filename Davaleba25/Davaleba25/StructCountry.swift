//
//  Class.swift
//  Davaleba25
//
//  Created by Kote Ghudushauri on 5/20/20.
//  Copyright © 2020 homework. All rights reserved.
//

import Foundation
struct Country: Codable {
    let name: String
    let capital: String
    let borders: [String]
    let currencies: [Currency]
}
struct Currency: Codable {
    let code, name, symbol: String?
}
