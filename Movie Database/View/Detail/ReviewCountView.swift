//
//  ReviewCountView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct ReviewCountView: View {
    
    var popularity: String
    
    init(popularity: String) {
        self.popularity = popularity
    }
    
    var body: some View {
        Text("(Popularity: \(popularity))")
            .font(.system(.footnote,design: .rounded))
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ReviewCountView(popularity: "0.0")
        .background(Color.gray)
}
