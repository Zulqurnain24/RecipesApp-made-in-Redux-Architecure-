//
//  Store.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import ReSwift

let store = Store<AppState>(
    reducer: mealReducer,
    state: nil
)
