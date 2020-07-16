//
//  collorExt.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let backgroundColor = UIColor.rgb(r: 13, g: 13, b: 13)
    static let outlineStrokeColor = UIColor.rgb(r: 0, g: 255, b: 204)
    static let trackStrokeColor = UIColor.rgb(r: 0, g: 153, b: 102)
    static let pulsatingFillColor = UIColor.rgb(r: 179, g: 255, b: 240)
}
