//
//  FavoriteItem.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct FavoriteItem: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    @State var movieID: Int?
    @State var movie: Movie
    
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            ZStack{
                
                if self.imageLoader.image != nil {
                    Image(uiImage:self.imageLoader.image!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 180)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                    
                    Image(systemName: "heart.circle.fill")
                        .font(.system(.callout))
                        .fontWeight(.bold)
                        .background(.yellow)
                        .clipShape(Circle())
                        .foregroundStyle(.black)
                        .offset(y:90)
                        .tint(.yellow)
                } else {
                    Rectangle()
                        .frame(width: 120, height: 180)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                }
                
            }
        }//: VSTACK
        .onAppear{
            if let movieID = movieID {
                self.movie.id = movieID
                self.imageLoader.loadImage(with: self.movie.posterURL)
            }
            //            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

#Preview(traits :.sizeThatFitsLayout) {
    FavoriteItem(movie: Movie.stubbedMovie)
}
