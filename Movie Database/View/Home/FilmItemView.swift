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
                        .frame(width: 185, height: 279)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                        .shadow(color: .black, radius: 2, x: 0, y: 2)
                    
                } else {
                    Rectangle()
                        .frame(width: 185, height: 279)
                        .clipShape(RoundedRectangle(cornerRadius:12))
                    Text("Movie Title")
                        .font(.custom("Gotham-Bold",size: 20))
                }
                
            }
            //NAME
            Text(movie.title.uppercased())
                .font(.custom("GothamBook",size: 13))
                .foregroundStyle(Color("ColorText"))
                .lineLimit(1)
                .shadow(color: .black, radius: 0.75, x: 0, y: 1)
                .multilineTextAlignment(.center)
        }//: VSTACK
        
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FilmItemView(movie: Movie.stubbedMovie)
        .background(Color("ColorBackground"))
}
