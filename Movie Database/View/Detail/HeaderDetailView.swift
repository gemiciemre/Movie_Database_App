//
//  HeaderDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct HeaderDetailView: View {
    
    var title: String
    var date: String
    var imdb: String
    var rating: String
    var popularity: String
    var language: String
    var year: String
    var duration: String
    var genres: [MovieGenre]?
    
    
    init(
        title: String = "Film Title",
        date: String = "0000",
        imdb: String = "0.0",
        rating: String = "0.0",
        popularity:String = "0.0",
        language: String = "language",
        year: String = "0000",
        duration: String = "Oh 00m",
        genres: [MovieGenre]? = nil
    )
    
    {
        self.title = title
        self.date = date
        self.imdb = imdb
        self.rating = rating
        self.popularity = popularity
        self.language = language
        self.year = year
        self.duration = duration
        self.genres = genres
    }
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6){
            HStack(alignment: .center,spacing: 6){
                IMDBView(imdb: imdb)
                
                RatingView(voteAvarage: rating)
                
                ReviewCountView(popularity: popularity)
                
            }
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical,6)
            
            DateInfoView(
                language: language,
                year: year,
                duration: duration
            )
            
            GenderHeaderView(genres: genres)
                .padding(.vertical,6)
                
        }
        .foregroundStyle(.white)
    }
}

#Preview(traits:.sizeThatFitsLayout) {
    HeaderDetailView()
        .padding()
        .background(Color.black)

}
