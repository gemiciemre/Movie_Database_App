//
//  FilmItemView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct FilmItemView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            ZStack{
                
                if self.imageLoader.image != nil {
                    Image(uiImage:self.imageLoader.image!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 185, height: 280)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                    
                } else {
                    Rectangle()
                        .frame(width: 200, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                    Text("Oppenheimer")
                        .font(.headline)
                }
                
            }
            //NAME
            Text(movie.title)
                .font(.headline)
                .lineLimit(1)
                .multilineTextAlignment(.center)
        }//: VSTACK
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FilmItemView(movie: Movie.stubbedMovie)
}
