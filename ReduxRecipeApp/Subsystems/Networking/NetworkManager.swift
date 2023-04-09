//
//  NetworkManager.swift
//  ReduxRecipeApp
//
//  Created by Mohammad Zulqurnain on 09/04/2023.
//

import Foundation

protocol Fetcheable {
    func searchMeals(url: URL)
}

struct NetworkManager: Fetcheable {
    func searchMeals(url: URL) {
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
