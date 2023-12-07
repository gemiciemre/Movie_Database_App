//
//  FavoriteItem.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct FavoriteItem: View {
    
    @ObservedObject private var movieDetailState = MovieDetailState()
    @StateObject var imageLoader = ImageLoader()
    
    @State var movie: Movie = Movie.stubbedMovie
    
    let movieID: Int
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            ZStack{
                
                AsyncImage(url: self.movieDetailState.movie?.posterURL) { phase in
                    switch phase {
                    case .success(let image):
                        // Resim başarıyla yüklendi
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius:12))
                        
                        Image(systemName: "heart.circle.fill")
                            .font(.system(.callout))
                            .fontWeight(.bold)
                            .background(.yellow)
                            .clipShape(Circle())
                            .foregroundStyle(.black)
                            .offset(y: -10)
                            .tint(.yellow)
                        
                    case .failure(_): 
                        // Resim yüklenemedi
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                            Text("Resim yüklenemedi.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                        
                    case .empty:
                        // URL boş
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius:12))
                            Text("Resim URL'si boş.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                        
                    @unknown default:
                        // Bilinmeyen durum
                        ZStack {
                            Rectangle()
                                .frame(width: 120, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius:12))
                            Text("Bilinmeyen bir hata oluştu.")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                        }
                        
                    }
                }
                
                

                
            }
        }//: VSTACK
        .onAppear{
            self.movieDetailState.loadMovie(id: self.movieID)
                
        }
    }
}

#Preview(traits :.sizeThatFitsLayout) {
    FavoriteItem(movieID: Movie.stubbedMovie.id)
}




/*
 self.movie.id = movieID
 
 print("Self.movie:\(self.movie.id)")
 print("movieID:\(movieID)")
 print("movieTitle:\(self.movie.title)")
 if self.movie.id == movieID {
     print("ImageURL: \(self.movie.posterURL)")
     
 }
 */



//                if self.imageLoader.image != nil {
//                    Image(uiImage:self.imageLoader.image!)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 120, height: 180)
//                        .clipShape(RoundedRectangle(cornerRadius:12))
//
//                    Image(systemName: "heart.circle.fill")
//                        .font(.system(.callout))
//                        .fontWeight(.bold)
//                        .background(.yellow)
//                        .clipShape(Circle())
//                        .foregroundStyle(.black)
//                        .offset(y:90)
//                        .tint(.yellow)
//                }
//                else {
//                    Rectangle()
//                        .frame(width: 120, height: 180)
//                        .clipShape(RoundedRectangle(cornerRadius:12))
//                }
