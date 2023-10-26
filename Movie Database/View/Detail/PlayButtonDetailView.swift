//
//  PlayButtonDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct PlayButtonDetailView: View {
    var body: some View {
        Button(action: {
            //someAction
        }, label: {
            Spacer()
            Image(systemName: "play.rectangle")
                .font(.title)
                .foregroundStyle(.white)
            Text("Play Now".uppercased())
                .font(.system(.title3,design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        })//: BUTTON
        .padding(10)
        .background(
            Color("ColorIMDB")
        )
        .clipShape(Capsule())
    }
}

#Preview {
    PlayButtonDetailView()
}
