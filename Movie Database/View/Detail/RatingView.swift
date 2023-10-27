//
//  RatingView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct RatingView: View {
    
    let voteAvarage: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: 6){
            Image(systemName: "star.fill")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(Color("ColorIMDB"))
            
            Text("\(voteAvarage)")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(Color("ColorIMDB"))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(voteAvarage: 0.0)
}
