//
//  ContentView.swift
//  Movie Database
//
//  Created by Emre Gemici on 18.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView(){
            HomeView(title: "Now Playing", movies: Movie.stubbedMovies)
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
            SearchView()
                .tabItem({
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                })
        }
        .tint(Color.black)
    }
}

#Preview {
    ContentView()
}
