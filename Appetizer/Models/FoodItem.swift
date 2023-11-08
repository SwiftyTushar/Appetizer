//
//  FoodItem.swift
//  Appetizer
//
//  Created by Tushar Patil on 06/11/23.
//

import Foundation
import SwiftUI

struct AppetizersResponse: Decodable{
    let request:[FoodItem]
}
struct FoodItem: Decodable,Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
