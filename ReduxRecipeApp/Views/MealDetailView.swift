//
//  DetailView.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import SwiftUI

@ViewBuilder
func NoContentView() -> some View {
    Text("No Content Available to Show")
}

struct MealDetailView: View {
    let meal: Meal
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // display the meal image
                if let url = URL(string: meal.thumbnailURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .clipped()
                }
                // display the meal name and category
                Text(meal.name)
                    .font(.title)
                Text(meal.category)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // display the meal area
                if !meal.area.isEmpty {
                    Text(meal.area)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // display the meal ingredients and instructions
                VStack(alignment: .leading, spacing: 16) {
                    Text("Ingredients")
                        .font(.headline)
                    var array = [meal.ingredient1, meal.ingredient2, meal.ingredient3, meal.ingredient4, meal.ingredient5, meal.ingredient6, meal.ingredient7, meal.ingredient8, meal.ingredient9, meal.ingredient10, meal.ingredient11, meal.ingredient12, meal.ingredient13, meal.ingredient14, meal.ingredient15, meal.ingredient16, meal.ingredient17, meal.ingredient18, meal.ingredient19, meal.ingredient20]
                    ForEach(array.filter({!($0?.isEmpty ?? true)}).compactMap({ element in
                        return element
                    }), id: \.self) { ingredient in
                        Text("- \(ingredient)")
                    }
                    
                    Text("Instructions")
                        .font(.headline)
                    Text(meal.instructions)
                }
                
                // add a favorite button
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .padding()
                }
                
                // add a share button
                Button(action: {
                    // present a share sheet with the meal name and image
                    let activityItems = [meal.name, URL(string: meal.thumbnailURL)!] as [Any]
                    let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .padding()
        }
        .navigationTitle(meal.name)
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: Meal.mock())
    }
}
