//
//  TitleView.swift
//  Movie Database
//
//  Created by Emre Gemici on 20.12.2023.
//

import SwiftUI

struct TitleView: View {
    
    var title: String
    
    var body: some View {
        HStack(alignment: .center){
            Rectangle()
                .frame(width: 5, height: 25)
                .foregroundStyle(Color("ColorIMDB"))
            Text(title)
                .font(.custom("Gotham-Bold", size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("ColorText"))
                .padding()
            Spacer()
            
            Button{
                // Some Action
            }label: {
                Text("See more")
                    .font(.custom("Gotham-Thin", size: 15))
                    .foregroundStyle(Color("ColorIMDB"))
                    .padding()
            }
        }
        
    }
}

#Preview {
    TitleView(title: "Now Playing")
        .background(Color("ColorBackground"))
}
