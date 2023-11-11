//
//  HeaderDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct HeaderDetailView: View {
    
    var title: String?
    var date: String?
    var imdb: String?
    var rating: String?
    var reviewCount: String?
    var language: String?
    var year: String?
    var duration: String?
    
    var genres:[MovieGenre]?
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6){
            HStack(alignment: .center,spacing: 6){
                IMDBView(imdb: imdb ?? "0.0")
                
                RatingView(voteAvarage: rating ?? "0.0")
                
                ReviewCountView()
                
            }
            Text(title ?? "Film Title")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical,6)
            
            DateInfoView(
                language: language ?? "language",
                year: year ?? "2023" ,
                duration: duration ??  "2h 30m"
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
