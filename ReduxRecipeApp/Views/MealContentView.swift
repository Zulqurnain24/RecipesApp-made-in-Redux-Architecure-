//
//  ContentView.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import Combine
import ReSwift
import SwiftUI

struct MealsResponse: Decodable {
    let meals: [Meal]
}

struct MealContentView: View {
    @ObservedObject var viewModel = MealViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.searchQuery, onCommit: {
                    viewModel.searchMeals()
                })
                .padding()
                
                List(viewModel.meals, id: \.self) { meal in
                    NavigationLink(destination: MealDetailView(meal: meal)) {
                        if let thumbnailURL = URL(string: meal.thumbnailURL) {
                            RemoteImage(url: thumbnailURL)
                                .frame(width: 44, height: 44)
                            Text(meal.name)
                        }
                    }
                }
                .navigationTitle("Meals")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      MealContentView(viewModel: MealViewModel())
    }
}
