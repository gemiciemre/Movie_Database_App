//
//  FilmItemView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct FilmItemView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            //ZStack{
                Image("oppenheimer")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 238)
                .clipShape(RoundedRectangle(cornerRadius:12))
            
            //NAME
            Text("Oppenheimer")
                .font(.title3)
                .fontWeight(.semibold)
                
            //}
        }//: VSTACK
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FilmItemView()
}
