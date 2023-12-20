//
//  HomeView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    
    init() {
        UINavigationBar.changeAppearance(clear: true)
        
    }
    
    @State private var isSearchViewVisible = false
    @State private var detailViewActive = false
    @State private var selectedMovieId: Int?
    
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var popularPlayingState = MovieListState()
    @ObservedObject private var upcomingPlayingState = MovieListState()
    
    // MARK: - BODY
    var body: some View {
//        if movieClass.showingMovie == false && movieClass.selectedMovie == nil {
        NavigationView {
            ZStack{
                VStack(spacing: 0){
                    
                    // MARK: - NAVIGATION BAR
                    NavigationBarView()
                        .padding(.horizontal,15)
                        .padding(.bottom)
                        .padding(.top, UIApplication
                            .shared
                            .connectedScenes
                            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                            .first { $0.isKeyWindow }?.safeAreaInsets.top)
                        .background(Color("ColorNavigationBar"))
                        .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y:5)
                    
                    // MARK: - SCROLL
                    ScrollView(.vertical, showsIndicators:false){
                        VStack(spacing: 0){
                            TabView{
                                if popularPlayingState.movies != nil{
                                    ForEach(popularPlayingState.movies!){ item in
                                        NavigationLink(destination:MovieDetailView(movieId: item.id)){
                                            VStack(alignment:.center){
                                                FilmBannerTabView(movie: item)
                                                
                                            }
                                        }
                                    }
                                }
                                else{
                                    LoadingView(
                                        isLoading: self.nowPlayingState.isLoading,
                                        error: self.nowPlayingState.error){
                                            self.nowPlayingState.loadMovies(with: .topRated)
                                        }
                                }
                            }//: TAB VIEW
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//                            .padding(.vertical,10)
                            .frame(minHeight: 310, alignment: .center) //, idealHeight: 250, maxHeight: .infinity
                            .shadow(color: .black, radius: 2, x: 0, y: 2)
                            
                            GenreGridView()
                                .padding(.vertical)
                            
                            // MARK: - UPCOMING
                            TitleView(title: "Upcoming")
                                .padding(.vertical)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(alignment:.top ,spacing: 16){
                                    if upcomingPlayingState.movies != nil {
                                        ForEach(upcomingPlayingState.movies!){ item in
                                            NavigationLink(destination: MovieDetailView(movieId: item.id)){
                                                FilmItemView(movie: item)
                                            }
                                        }
                                    }else{
                                        LoadingView(
                                            isLoading: self.upcomingPlayingState.isLoading,
                                            error: self.upcomingPlayingState.error){
                                                self.upcomingPlayingState.loadMovies(with: .upcoming)
                                            }
                                    }
                                }
                            }
                            
                            Spacer(minLength: 20)
                          
                            // MARK: - NOW PLAYING
                            TitleView(title: "Now Playing")
                                .padding(.vertical)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(alignment:.top ,spacing: 16){
                                    if nowPlayingState.movies != nil {
                                        ForEach(nowPlayingState.movies!){ item in
                                            NavigationLink(destination: MovieDetailView(movieId: item.id)){
                                                FilmItemView(movie: item)
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
                            }
                            
                            
                            
                            Spacer(minLength: 50)
                            
                            // MARK: - FOOTER
                            FooterView()
                        }
                    }//: SCROLL
                }//: VSTACK
            }//: ZSTACK
            
            .ignoresSafeArea(.all,edges: .top)
            .onAppear{
                self.nowPlayingState.loadMovies(with: .nowPlaying)
                self.popularPlayingState.loadMovies(with: .popular)
                self.upcomingPlayingState.loadMovies(with: .upcoming)
            }
            .background(Color("ColorBackground"))
            .toolbar(.visible,for: .tabBar)
            
        }
        .accentColor(.black)
    }
}

#Preview {
    HomeView()
}



//.onTapGesture {
////                                                withAnimation(.easeOut){
////                                                    movieClass.selectedMovie = item
////                                                    print("\(String(describing: movieClass.selectedMovie))")
////                                                }
//    selectedMovieId = item.id
//    print("\(String(describing: selectedMovieId))")
//    detailViewActive = true
//}
//.sheet(isPresented: $detailViewActive){
//    if let selectedId = selectedMovieId {
//        MovieDetailView(movieId: selectedId)
//    }
//}


/*
 LazyVGrid(columns: gridLayout,spacing: 15){
      if nowPlayingState.movies != nil {
          ForEach(nowPlayingState.movies!){ item in
              NavigationLink(destination: MovieDetailView(movieId: item.id)){
                  FilmItemView(movie: item)
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
 */

