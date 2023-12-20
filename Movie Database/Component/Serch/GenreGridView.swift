//
//  GenreGridView.swift
//  Movie Database
//
//  Created by Emre Gemici on 9.12.2023.
//

import SwiftUI

struct GenreGridView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false,content:{
            LazyHGrid(rows: gridLayout,alignment: .center,spacing: columnSpacing,pinnedViews: [], content:{
                Section(
                    header: SectionView(rotateClockwise: false),
                    footer: SectionView(rotateClockwise: true))
                    {
                        ForEach(genres){ genre in
                            GenreItemView(genre: genre)
                    }
                }
            })//: GRID
            .frame(height: 120) //140
            .padding(.horizontal) //15
            .padding(.vertical) //10
        })//: SCROLL
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GenreGridView()
        .previewLayout(.device)
        .padding()
        .background(colorBackground)
}
