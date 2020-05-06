//
//  ThisIsUserDefaults.swift
//  Davaleba login+register+profile
//
//  Created by Kote Ghudushauri on 5/6/20.
//  Copyright © 2020 homework. All rights reserved.
//

import Foundation

class SaveSystem {
    static let NO_EXIT = "NO_EXIT"
    
    static func beginotclicked() {
        UserDefaults.standard.set(true, forKey: NO_EXIT)
    }
    static func clicked() {
        UserDefaults.standard.set(false, forKey: NO_EXIT)
    }
    static func notclicked() -> Bool {
        return UserDefaults.standard.bool(forKey: NO_EXIT)
    }
}
