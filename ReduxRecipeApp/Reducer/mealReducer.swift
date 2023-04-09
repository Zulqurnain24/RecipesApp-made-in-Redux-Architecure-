//
//  Reducer.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import ReSwift

func mealReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()

    switch action {
    case MealAction.search(let query):
        state.searchQuery = query
    case MealAction.updateMeals(let meals):
        state.meals = meals
    default:
        break
    }

    return state
}
