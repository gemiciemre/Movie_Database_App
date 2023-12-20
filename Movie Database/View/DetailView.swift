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
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
    }
}



struct DetailView: View {
    
    // MARK: - PROPERTIES
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    @ObservedObject private var articleContent: ViewFrame = ViewFrame()
    
    private let imageHeight: CGFloat = 500
    private let collapsedImageHeight: CGFloat = 75
    
    @State private var titleRect: CGRect = .zero
    @State private var headerImageRect: CGRect = .zero
    
    @Environment(\.dismiss) private var dismiss
    
    func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let sizeOffScreen = imageHeight - collapsedImageHeight
        
        // if our offset is roughly less than -225 (the amount scrolled / amount off screen)
        if offset < -sizeOffScreen {
            
            let imageOffset = abs(min(-sizeOffScreen, offset))
            
            return imageOffset - sizeOffScreen
        }
        
        // Image was pulled down
        if offset > 0 {
            return -offset
        }
        return 0
    }
    
    func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
    
    // at 0 offset our blur will be 0
    // at 300 offset our blur will be 6
    
    func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).maxY
        
        let height = geometry.size.height
        let blur = (height - max(offset, 0)) / height // (values will range from 0 - 1)
        
        return blur * 6 // Values will range from 0 - 6
    }
    
    // 1
    private func getHeaderTitleOffset() -> CGFloat {
        let currentYPos = titleRect.midY
        
        if currentYPos < headerImageRect.maxY {
            let minYValue: CGFloat = 50.0
            let maxYValue: CGFloat = collapsedImageHeight
            let currentYValue = currentYPos
            
            let percentage = max(-1, (currentYValue - maxYValue) / (maxYValue - minYValue))
            let finalOffset: CGFloat = -30.0
            
            return 20 - (percentage * finalOffset)
        }
        
        return .infinity
    }
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                VStack(alignment: .center,spacing: 0){
                    HStack {
                        HeaderDetailView(
                            title: self.movie.title,
                            date: self.movie.releaseDate!,
                            imdb: "0.0",
                            rating: self.movie.voteAverageText,
                            popularity: self.movie.popularityText,
                            language: self.movie.originalLanguage!,
                            year: self.movie.yearText,
                            duration: self.movie.durationText,
                            genres: self.movie.genres
                        )
                        Spacer()
                    }
                    PlayButtonDetailView(key: self.movie.movieVideoKey)
                        .padding(.horizontal)
                        .padding()
                    MovieOverviewView(overview: self.movie.overview)
                        .padding(.vertical)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.secondary)
                        .padding(.vertical)
                    Text("Top Cast")
                        .font(.title3.bold())
                        .padding(.bottom,5)
                        .padding(.trailing,250)
                        .foregroundStyle(.white)
                    
                    TopCastsView(casts: self.movie.cast)
                        .padding(.top)
                        .padding(.bottom,50)
                    Spacer(minLength: 50)
                    
                }//: VSTACK
                .padding(.horizontal)
                .padding(.top, 16.0)
                //                .background(BlurEffectView(style: .dark))//.padding(.top,-50))
            }
            .offset(y: imageHeight) // + 16
            .background(GeometryGetter(rect: $articleContent.frame))
            
            GeometryReader { geometry in
                // 3
                ZStack(alignment: .bottom) {
                    
                    AsyncImage(url: self.movie.posterURL) { phase in
                        switch phase {
                        case .success(let image):
                            // Resim başarıyla yüklendi
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
                                .blur(radius: self.getBlurRadiusForImage(geometry))
                                .clipped()
                                .background(GeometryGetter(rect: self.$headerImageRect))
                        case .failure(_):
                            // Resim yüklenemedi
                            Text("Resim yüklenirken bir hata oluştu.")
                        case .empty:
                            // URL boş
                            Text("Resim URL'si boş.")
                        @unknown default:
                            // Bilinmeyen durum
                            Text("Bilinmeyen bir hata oluştu.")
                        }
                    }
                    // 4
                    VStack {
                        Text(self.movie.tagline ?? "")
                            .font(.custom("Gotham-Black", size: 17))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .offset(x: 0, y: self.getHeaderTitleOffset())
                            .shadow(radius: 1)
                    }
                }
                .clipped()
                .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
            }.frame(height: imageHeight)
                .offset(x: 0, y: -(articleContent.startingRect?.maxY ?? UIScreen.main.bounds.height))
        }//: SCROLL
        .background(Color("ColorBackground"))
        .ignoresSafeArea(edges: .all)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                NavBackButton(dismiss: self.dismiss)
            }
            ToolbarItem(placement: .topBarTrailing){
                FavoriteButton(movieID: self.movie.id)
            }
        }
        .toolbar(.hidden,for: .tabBar)
    }
}

#Preview {
   NavigationStack {
        MovieDetailView(movieId: Movie.stubbedMovie.id)
   }
}


struct NavBackButton: View {
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.backward.circle.fill")
                .resizable()
                .font(.title)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .foregroundStyle(Color("ColorIMDB"))
        }
    }
}

struct FavoriteButton: View {
    
    @ObservedObject private var favoriteManager = Favorite()
    let movieID: Int
    
    var body: some View {
        Button {
            favoriteManager.toggleFavorite(movieID: self.movieID)
            if let favoriteIDs = UserDefaults.standard.array(forKey: "favoriteMovieIDs") as? [Int] {
                print("Favorite Movie IDs:")
                for item in favoriteIDs {
                    print(item)
                }
            } else {
                print("Favorite Movie IDs not found in UserDefaults")
            }
        } label: {
            Image(systemName: favoriteManager.favoriteMovieIDs.contains(self.movieID) ? "heart.circle.fill" : "heart.circle")
                .resizable()
                .font(.title)
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .foregroundStyle(Color("ColorIMDB"))
        }
    }
}
