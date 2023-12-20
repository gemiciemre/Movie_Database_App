//
//  FavoriteItem.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct FavoriteItem: View {
    
    @StateObject var movieFavoriteState = MovieFavoriteState()
    
    @State var movie: Movie = Movie.stubbedMovie
    
    let movieID: Int
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            ZStack{
                if self.movieFavoriteState.image != nil {
                    Image(uiImage:self.movieFavoriteState.image!)
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
                        .offset(y:90)
                        .tint(.yellow)
                }
                else {
                    Rectangle()
                        .frame(width: 120, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                }
            }
        }//: VSTACK
        .onAppear{
            self.movieFavoriteState.loadMovie(id: self.movieID)
            if self.movieFavoriteState.movie != nil{
                self.movieFavoriteState.loadImage()
            }
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





//AsyncImage(url: self.movieFavoriteState.movie?.posterURL) { phase in
//    switch phase {
//    case .success(let image):
//        // Resim başarıyla yüklendi
//        image
//            .resizable()
//            .scaledToFit()
//            .frame(width: 120, height: 180)
//            .clipShape(RoundedRectangle(cornerRadius:12))
//        
//        Image(systemName: "heart.circle.fill")
//            .font(.system(.callout))
//            .fontWeight(.bold)
//            .background(.yellow)
//            .clipShape(Circle())
//            .foregroundStyle(.black)
//            .offset(y: -10)
//            .tint(.yellow)
//        
//    case .failure(_):
//        // Resim yüklenemedi
//        ZStack {
//            Rectangle()
//                .frame(width: 120, height: 180)
//                .clipShape(RoundedRectangle(cornerRadius:12))
//            Text("Resim yüklenemedi.")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//                .foregroundStyle(.white)
//        }
//        
//    case .empty:
//        // URL boş
//        ZStack {
//            Rectangle()
//                .frame(width: 120, height: 180)
//                .clipShape(RoundedRectangle(cornerRadius:12))
//            Text("Resim URL'si boş.")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//                .foregroundStyle(.white)
//        }
//        
//    @unknown default:
//        // Bilinmeyen durum
//        ZStack {
//            Rectangle()
//                .frame(width: 120, height: 180)
//                .clipShape(RoundedRectangle(cornerRadius:12))
//            Text("Bilinmeyen bir hata oluştu.")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//                .foregroundStyle(.white)
//        }
//    }
//}
