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
    
    // MARK: - PROPERTIES
    
    let movie: Movie
    let imageLoader = ImageLoader()
    let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg")
    
    private let imageHeight: CGFloat = 500
    private let collapsedImageHeight: CGFloat = 75
    
    
    @ObservedObject private var articleContent: ViewFrame = ViewFrame()
    @State private var titleRect: CGRect = .zero
    @State private var headerImageRect: CGRect = .zero
    
    
    func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let sizeOffScreen = imageHeight - collapsedImageHeight
        
        // if our offset is roughly less than -225 (the amount scrolled / amount off screen)
        if offset < -sizeOffScreen {
            // Since we want 75 px fixed on the screen we get our offset of -225 or anything less than. Take the abs value of
            let imageOffset = abs(min(-sizeOffScreen, offset))
            
            // Now we can the amount of offset above our size off screen. So if we've scrolled -250px our size offscreen is -225px we offset our image by an additional 25 px to put it back at the amount needed to remain offscreen/amount on screen.
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
        
        // (x - min) / (max - min) -> Normalize our values between 0 and 1
        
        // If our Title has surpassed the bottom of our image at the top
        // Current Y POS will start at 75 in the beggining. We essentially only want to offset our 'Title' about 30px.
        if currentYPos < headerImageRect.maxY {
            let minYValue: CGFloat = 50.0 // What we consider our min for our scroll offset
            let maxYValue: CGFloat = collapsedImageHeight // What we start at for our scroll offset (75)
            let currentYValue = currentYPos
            
            let percentage = max(-1, (currentYValue - maxYValue) / (maxYValue - minYValue)) // Normalize our values from 75 - 50 to be between 0 to -1, If scrolled past that, just default to -1
            let finalOffset: CGFloat = -30.0 // We want our final offset to be -30 from the bottom of the image header view
            
            // We will start at 20 pixels from the bottom (under our sticky header)
            // At the beginning, our percentage will be 0, with this resulting in 20 - (x * -30)
            // as x increases, our offset will go from 20 to 0 to -30, thus translating our title from 20px to -30px.
            
            return 20 - (percentage * finalOffset)
        }
        
        return .infinity
    }
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView{
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
                        .padding(.bottom,50)
                    
                    
                    
                }//: VSTACK
                .padding(.horizontal)
                .padding(.top, 16.0)
                .background(BlurEffectView(style: .dark).padding(.top,-50))
            }
            .offset(y: imageHeight + 16)
            .background(GeometryGetter(rect: $articleContent.frame))
            
            GeometryReader { geometry in
                // 3
                ZStack(alignment: .bottom) {
                    AsyncImage(url: imageURL) { phase in
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
                    Text(self.movie.tagline ?? "")
                        .font(.avenirNext(size: 17))
                        .foregroundColor(.white)
                        .offset(x: 0, y: self.getHeaderTitleOffset())
                }
                .clipped()
                .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
            }.frame(height: imageHeight)
                .offset(x: 0, y: -(articleContent.startingRect?.maxY ?? UIScreen.main.bounds.height))
        }
        .background(Color.black)
        .ignoresSafeArea(edges: .all)
    }
}

#Preview {
//    MovieDetailView(movieId: Movie.stubbedMovie.id)
    DetailView(movie: movieSample)
}

