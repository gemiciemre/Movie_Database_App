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
    var rating: Double?
    var reviewCount: String?
    
    var genders:[String]?
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6){
            HStack(alignment: .center,spacing: 6){
                IMDBView(imdb: imdb ?? "**")
                
                RatingView(voteAvarage: rating ?? 0.0)
                
                ReviewCountView()
                
            }
            Text("Selam")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical,6)
            
            DateInfoView()
            
            GenderHeaderView()
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
