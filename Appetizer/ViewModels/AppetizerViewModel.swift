//
//  AppetizerViewModel.swift
//  Appetizer
//
//  Created by Tushar Patil on 07/11/23.
//

import Foundation
import SwiftUI


class AppetizerViewModel: ObservableObject{
    @Published var foodItems:[FoodItem] = []
    @Published var showError:Bool = false
    @Published var errorMessage = String()
    @Published var isLoading = true
    
    func fetchFoodItems(){
        isLoading = true
        foodItems = []
        NetworkManager.shared.fetchData { rFoodItems, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if error != nil{
                    self.showError = true
                    self.errorMessage = error ?? ""
                    print("ErrorOccured- \(error ?? "nil")")
                } else {
                    self.showError = false
                    self.errorMessage = String()
                    self.foodItems = rFoodItems ?? []
                }
            }
        }
    }
}
