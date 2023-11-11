//
//  GenderHeaderView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct GenderHeaderView: View {
    
    let genres: [MovieGenre]
    
    init(genres: [MovieGenre]? = nil) { self.genres = genres ??
            [
                MovieGenre(name: "DefaultGenre1"),
                MovieGenre(name: "DefaultGenre2")
            ]
        }
    
    var body: some View {
        HStack {
            ForEach(genres, id: \.self){ item in
                if item != nil {
                    Circle()
                        .frame(width: 5 ,height: 5)
                        .foregroundStyle(Color("ColorIMDB"))
                }
                Text(item.name)
                    .font(.system(.headline,design: .rounded))
                    .fontWeight(.light)
            }
        }
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    GenderHeaderView()
}


/*
#if DEBUG
struct GenderHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleGenres = [
            MovieGenre(name: "Action"),
            MovieGenre(name: "Comedy"),
            MovieGenre(name: "Drama")
        ]

        return GenderHeaderView(genres: sampleGenres)
            .previewLayout(.sizeThatFits)
    }
}
#endif


 */
