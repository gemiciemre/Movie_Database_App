//
//  GenreItemView.swift
//  Movie Database
//
//  Created by Emre Gemici on 9.12.2023.
//

import SwiftUI

struct GenreItemView: View {
    let genre : Genre
    
    var body: some View {
        Button{
            //Some Action
        }label: {
            HStack(alignment:.center,spacing:6){
                Image(genre.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(.gray)
                
                Text(genre.name.uppercased())
//                    .font(.system(size: 15))
                    .font(.custom("Gotham-Bold", size: 13))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Spacer()
                
            }//: HSTACK
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
            )
        }//: BUTTON
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GenreItemView(genre: genres[0])
        .previewLayout(.sizeThatFits)
        .padding()
        .background(colorBackground)
}
