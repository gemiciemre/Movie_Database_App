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
            HomeView()
                .tabItem({
                    Image(systemName: "house")
                    Text("Home")
                })
            FavoriteView(movie: Movie.stubbedMovie, movies: Movie.stubbedMovies)
                .tabItem({
                    Image(systemName: "heart")
                    Text("Favorites")
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
