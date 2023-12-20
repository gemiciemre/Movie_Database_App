//
//  ContentView.swift
//  Movie Database
//
//  Created by Emre Gemici on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
                .tag(0)
            FavoriteView()
                .tabItem({
                    Image(systemName: "heart")
                    Text("Favorites")
                })
                .tag(1)
            SearchView()
                .tabItem({
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                })
                .tag(2)
        }
        .tint(Color.black)
        
    }
}

#Preview {
    ContentView()
}
