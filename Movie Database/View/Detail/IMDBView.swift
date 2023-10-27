//
//  IMDBView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct IMDBView: View {
    
    let imdb: String
    
    var body: some View {
        Text("IMDB: \(imdb)")
            .font(.system(.footnote, design: .rounded))
            .fontWeight(.regular)
            .foregroundStyle(.black)
            .padding(4)
            .background(Color("ColorIMDB"))
            .clipShape(Capsule())
    }
}

#Preview(traits:.sizeThatFitsLayout) {
    IMDBView(imdb: "")
}
