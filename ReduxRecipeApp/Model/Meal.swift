//
//  Meal.swift
//  ReduxRecipeApp
//
//  Created by Muhammad Zulqurnain on 09/04/2023.
//

import Foundation

struct Meal: Codable {
  let id: String
  let name: String
  let category: String
  let area: String
  let instructions: String
  let thumbnailURL: String
  let youtubeURL: String
  let ingredient1: String?
  let ingredient2: String?
  let ingredient3: String?
  let ingredient4: String?
  let ingredient5: String?
  let ingredient6: String?
  let ingredient7: String?
  let ingredient8: String?
  let ingredient9: String?
  let ingredient10: String?
  let ingredient11: String?
  let ingredient12: String?
  let ingredient13: String?
  let ingredient14: String?
  let ingredient15: String?
  let ingredient16: String?
  let ingredient17: String?
  let ingredient18: String?
  let ingredient19: String?
  let ingredient20: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case name = "strMeal"
    case category = "strCategory"
    case area = "strArea"
    case instructions = "strInstructions"
    case thumbnailURL = "strMealThumb"
    case youtubeURL = "strYoutube"
    case ingredient1 = "strIngredient1"
    case ingredient2 = "strIngredient2"
    case ingredient3 = "strIngredient3"
    case ingredient4 = "strIngredient4"
    case ingredient5 = "strIngredient5"
    case ingredient6 = "strIngredient6"
    case ingredient7 = "strIngredient7"
    case ingredient8 = "strIngredient8"
    case ingredient9 = "strIngredient9"
    case ingredient10 = "strIngredient10"
    case ingredient11 = "strIngredient11"
    case ingredient12 = "strIngredient12"
    case ingredient13 = "strIngredient13"
    case ingredient14 = "strIngredient14"
    case ingredient15 = "strIngredient15"
    case ingredient16 = "strIngredient16"
    case ingredient17 = "strIngredient17"
    case ingredient18 = "strIngredient18"
    case ingredient19 = "strIngredient19"
    case ingredient20 = "strIngredient20"
  }
}

extension Meal: Equatable, Hashable {
  static func == (lhs: Meal, rhs: Meal) -> Bool {
    lhs.id == rhs.id
  }
}

extension Meal {
  static func mock() -> Meal {
    return Meal(id: "0", name: "XYZMeal", category: "XYZCategory", area: "XYZArea", instructions: "XYZInstructiond", thumbnailURL: "xyz.com", youtubeURL: "youtube.com", ingredient1: "ingredient1", ingredient2: "ingredient2", ingredient3: nil, ingredient4: nil, ingredient5: nil, ingredient6: nil, ingredient7: nil, ingredient8: nil, ingredient9: nil, ingredient10: nil, ingredient11: nil, ingredient12: nil, ingredient13: nil, ingredient14: nil, ingredient15: nil, ingredient16: nil, ingredient17: nil, ingredient18: nil, ingredient19: nil, ingredient20: nil)
  }
}
