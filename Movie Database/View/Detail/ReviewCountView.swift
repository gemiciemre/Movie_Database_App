//
//  ReviewCountView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct ReviewCountView: View {
    var body: some View {
        Text("(Popularity: 160) ")
            .font(.system(.footnote,design: .rounded))
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ReviewCountView()
}
