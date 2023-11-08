//
//  HomeView.swift
//  Appetizer
//
//  Created by Tushar Patil on 06/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.foodItems){ item in
                    FoodItemView(food: item)
                }
                .navigationTitle("Appetizers 🍟")
            }
            .onAppear{
                fetchData()
            }
            if viewModel.isLoading{
                ProgressView()
            }
        }
        .alert(isPresented: $viewModel.showError,content: {
            Alert(title: Text("Error"),message: Text(viewModel.errorMessage))
        })
        
    }
    private func fetchData(){
        viewModel.fetchFoodItems()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
