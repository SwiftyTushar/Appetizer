//
//  ContentView.swift
//  Appetizer
//
//  Created by Tushar Patil on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrdersView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orders")
                }
        }
        .tint(Color("brandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
