//
//  HomeView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @State private var isSearchViewVisible = false
    
    @EnvironmentObject var movieClass : Movies
    
    @ObservedObject private var nowPlayingState = MovieListState()
    
    let title: String
    let movies: [Movie]
    
    // MARK: - BODY
    var body: some View {
        if isSearchViewVisible != true {
            ZStack{
                VStack(spacing: 0){
                    
                    // MARK: - NAVIGATION BAR
                    NavigationBarView()
                        .padding(.horizontal,15)
                        .padding(.bottom)
                        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y:5)
                    
                    // MARK: - SCROLL
                    ScrollView(.vertical, showsIndicators:false){
                        VStack(spacing: 0){
                            FilmBannerTabView()
                                .padding(.vertical,10)
                                .frame(minHeight: 310)
                            
                            GenreView()
                                .frame(width: 350)
                                .padding()
                            
                            LazyVGrid(columns: gridLayout,spacing: 15){
                                if nowPlayingState.movies != nil {
                                    ForEach(nowPlayingState.movies!){ item in
                                        FilmItemView(movie: item)
                                            .onTapGesture {
                                                withAnimation(.easeOut){
                                                    movieClass.selectedMovie = item
                                                    isSearchViewVisible.toggle()
                                                }
                                            }
                                    }
                                }else{
                                    LoadingView(
                                        isLoading: self.nowPlayingState.isLoading,
                                        error: self.nowPlayingState.error){
                                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                                        }
                                }
                                
                                
                            }
                            // MARK: - FOOTER
                            FooterView()
                        }
                    }//: SCROLL
                }//: VSTACK
            }//: ZSTACK
            .ignoresSafeArea(.all,edges: .top)
            .onAppear{
                self.nowPlayingState.loadMovies(with: .nowPlaying)
            }
        }else{
           // Some Codes
        }
    }
}

#Preview {
    HomeView(title: "Now Playing", movies: Movie.stubbedMovies)
}
