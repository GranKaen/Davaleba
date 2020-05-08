//
//  UDManager.swift
//  Davaleba 18v2
//
//  Created by Kote Ghudushauri on 5/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import Foundation
class UDManager{
    static let MAIN_PAGE = "MAIN_PAGE"
    
    static func getUD()->UserDefaults{
        return UserDefaults.standard
    }
    
    static func savePage(){
        return getUD().set(true, forKey: MAIN_PAGE)
    }
    
    static func MainPageValue()->Bool{
        return getUD().bool(forKey: MAIN_PAGE)
    }
}
