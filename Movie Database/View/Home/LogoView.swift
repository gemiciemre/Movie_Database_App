//
//  LogoView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 8, content: {
            Text("Movie".uppercased())
                .font(.custom("Gotham-Bold", size: 20))
                .foregroundStyle(Color("ColorText"))
                .foregroundStyle(.black)
            
            Image("logo-icon")
                .renderingMode(.template)
                .foregroundColor(Color("ColorIMDB"))
//                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30,alignment: .center)
            
            Text("Database".uppercased())
                .font(.custom("Gotham-Bold", size: 20))
                .foregroundStyle(Color("ColorText"))
                .foregroundStyle(.black)
        })//: HSTACK
    }
}

#Preview {
    LogoView()
        .padding()
        .background(Color("ColorNavigationBar"))
}
