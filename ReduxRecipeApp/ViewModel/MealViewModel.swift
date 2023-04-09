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

    init() {
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
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(MealsResponse.self, from: data)
                    store.dispatch(MealAction.updateMeals(meals: result.meals))
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}
