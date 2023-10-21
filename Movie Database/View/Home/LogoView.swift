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
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            
            Image("logo-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30,alignment: .center)
            
            Text("Database".uppercased())
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
        })//: HSTACK
    }
}

#Preview {
    LogoView()
        .padding()
}
