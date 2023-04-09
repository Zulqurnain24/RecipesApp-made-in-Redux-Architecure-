//
//  Actions.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import ReSwift

enum MealAction: Action {
    case search(query: String)
    case updateMeals(meals: [Meal])
}
