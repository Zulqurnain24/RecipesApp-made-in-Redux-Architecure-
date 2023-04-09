//
//  ViewModel.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import Combine
import Foundation
import ReSwift

class MealViewModel: ObservableObject, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState

    @Published var meals: [Meal] = []
    @Published var searchQuery: String = ""

    let networkManager: Fetcheable
    
    init(networkManager: Fetcheable) {
        self.networkManager = networkManager
        store.subscribe(self)
    }

    func newState(state: AppState) {
      DispatchQueue.main.async { [weak self] in
        self?.meals = state.meals
        self?.searchQuery = state.searchQuery
      }
    }

    func searchMeals() {
        store.dispatch(MealAction.search(query: searchQuery))
        if let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchQuery)") {
            networkManager.searchMeals(url: url)
        }
    }
}
