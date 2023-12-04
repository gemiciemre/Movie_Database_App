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
    
    @EnvironmentObject var movieClass : Movies
    
    
    @ObservedObject private var nowPlayingState = MovieListState()
    
    
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
                    //                        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .padding(.top, UIApplication
                            .shared
                            .connectedScenes
                            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                            .first { $0.isKeyWindow }?.safeAreaInsets.top)
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
                            
                            Text("Now Playing")
                                .font(.avenirNext(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding()
                            
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

