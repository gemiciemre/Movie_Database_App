//
//  DetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 22.10.2023.
//

import SwiftUI


struct MovieDetailView: View {
    
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                DetailView(movie: self.movieDetailState.movie!)
                
            }
        }
        .navigationBarTitle(movieDetailState.movie?.title ?? "")
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
    }
}



struct DetailView: View {
    
    let movie: Movie
    let imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .center,spacing: 0){
            ZStack {
                ImageDetailView(imageURL: self.movie.posterURL)
                NavigationBarDetailView()
                    .padding(.horizontal)
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y: 5)
                    .offset(y: -180)
                    
                
            }
            Spacer()
            VStack(alignment: .leading,spacing: 0){
                ScrollView(.vertical,showsIndicators: false) {
                    HStack {
                        HeaderDetailView(
                            title: self.movie.title,
                            date: self.movie.releaseDate,
                            imdb: "7.9",
                            rating: self.movie.voteAverageText
                            //reviewCount: <#T##String?#>,
                            //category: <#T##String?#>,
//                            year: <#T##String?#>,
//                            duration: <#T##String?#>,
//                            genders: <#T##[String]?#>
                        )
                            .padding(.top)
                        Spacer()
                    }
                    PlayButtonDetailView()
                        .padding(.horizontal)
                        .padding()
                    MovieOverviewView()
                        .padding(.vertical)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.secondary)
                        .padding(.vertical)
//                    Text("Top Cast")
//                        .font(.title3.bold())
//                        .padding(.bottom,5)
//                        .padding(.trailing,250)
//                        .foregroundStyle(.white)
//                    
                    TopCastsView()
                }
                Spacer()
            }
            .padding(.horizontal)
            .frame(width:400)
            .background(BlurEffectView(style: .dark).padding(.top,-50))
            .clipShape(CustomShapeDetailView())
            
            
        }
        //.zIndex(0)
        .ignoresSafeArea(.all,edges: .all)
        .background(Color.black)
    }
}

#Preview {
    MovieDetailView(movieId: Movie.stubbedMovie.id)
}

