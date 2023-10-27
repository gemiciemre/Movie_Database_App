//
//  ImageDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct ImageDetailView: View {
    
    let movie: Movie
    
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        
        ZStack{
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 420)
            }
        }
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

#Preview {
    ImageDetailView(movie: Movie.stubbedMovie)
}
