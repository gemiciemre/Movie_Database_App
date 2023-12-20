//
//  ImageDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct ImageDetailView: View {
    
    let imageURL: URL
    let sampleURL: URL = URL(string: "https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg")!
    
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
            self.imageLoader.loadImage(with: imageURL)
        }
    }
}

#Preview {
    ImageDetailView(imageURL: URL(string: "https://image.tmdb.org/t/p/w500/8WUVHemHFH2ZIP6NWkwlHWsyrEL.jpg")!)
}

// Sonrasında Resimlerin Cacheden çekilmesiyle ilgileneceğim.



