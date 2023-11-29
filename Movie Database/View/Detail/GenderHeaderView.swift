//
//  GenderHeaderView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct GenderHeaderView: View {
    
    var genres: [MovieGenre]
    
    init(genres: [MovieGenre]? = nil) { 
        self.genres = genres ??
        [
            MovieGenre(id: 1, name: "DefaultGenre1"),
            MovieGenre(id: 2, name: "DefaultGenre2")
        ]
    }
    
    var body: some View {
        HStack {
            ForEach(self.genres){ item in
                Circle()
                    .frame(width: 5 ,height: 5)
                    .foregroundStyle(Color("ColorIMDB"))
                
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
