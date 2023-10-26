//
//  FavoriteView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @State private var favoriteSearch: String = ""

    let movies: [Movie]
    
    var body: some View {

        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                LazyVGrid(columns: gridLayoutFavoriteItem,spacing: 15){
                    ForEach(self.movies){ item in
                        FavoriteItem(movie: item)
                    }
                }            
            }
        }
        .searchable(text: $favoriteSearch)
    }
}

#Preview {
    FavoriteView(movies: Movie.stubbedMovies)
}
