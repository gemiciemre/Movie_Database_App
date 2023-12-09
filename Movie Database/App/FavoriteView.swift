//
//  FavoriteView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct FavoriteView: View {
    

    @StateObject var favoriteManager = Favorite()
    
    @State private var favoriteSearch: String = ""

    
    var body: some View {
        
        NavigationView{
            VStack(alignment:.center,spacing: 0){
                NavigationBarView()
                    .padding(.horizontal,15)
                    .padding(.bottom)
                    .padding(.top, UIApplication
                        .shared
                        .connectedScenes
                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                        .first { $0.isKeyWindow }?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y:5)
                
                
                
                ScrollView(.vertical,showsIndicators: false) {
                    
                    SearchBarView(placeholder: "Search movies", text: self.$favoriteSearch)
                        .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .padding()
                    
                    LazyVGrid(columns: gridLayoutFavoriteItem,spacing: 15){
                        ForEach(Array(favoriteManager.favoriteMovieIDs), id: \.self){ item in
                            NavigationLink(destination: MovieDetailView(movieId: item)){
                                FavoriteItem(movieID: item)
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea(.all,edges:.top)
        }
        .onAppear{
            favoriteManager.loadFavoriteMovieIDs()
        }
        
    }
}

#Preview {
    FavoriteView()
}
