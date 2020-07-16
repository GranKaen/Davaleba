//
//  recipeModel.swift
//  FinaluriProjectiReal
//
//  Created by konstantine gudushauri on 7/13/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import Foundation

struct RecipeViewModel {
    
    var recipeName: String
    var recipeimage: String
    init(hit: Hit) {
        recipeName = hit.recipe.label
        recipeimage = hit.recipe.image
    }
}
