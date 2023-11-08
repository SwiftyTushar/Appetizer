//
//  FoodItemView.swift
//  Appetizer
//
//  Created by Tushar Patil on 06/11/23.
//

import SwiftUI

struct FoodItemView: View {
    var food:FoodItem
    var body: some View {
        HStack(alignment: .center){
            AppetizerRemoteImage(url: food.imageURL)
                .frame(width: 100,height: 75)
                .cornerRadius(10)
            VStack(alignment: .leading,spacing: 5){
                Text(food.name)
                    .font(.headline)
                Text("$\(food.price,specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(food: MockData.orderItemOne)
    }
}
