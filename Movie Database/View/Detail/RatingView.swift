//
//  RatingView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 6){
            Image(systemName: "star.fill")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(Color("ColorIMDB"))
            
            Text("8.9")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(Color("ColorIMDB"))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView()
}
