//
//  PlayButtonDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct PlayButtonDetailView: View {
    
    let key: String?
    var playVideoURL: URL? {
        if let key = self.key, !key.isEmpty {
            return URL(string: "https://youtube.com/watch?v=\(key)")
        } else {
            return URL(string: "https://youtube.com")
        }
    }
    
    @State private var showingVideo: Bool = false
    
    var body: some View {
        Button(action: {
            showingVideo.toggle()
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
        .shadow(color: .black, radius: 2, x: 0, y: 2)
        .sheet(isPresented:$showingVideo){
            SafariView(url: (playVideoURL ?? URL(string: "https://youtube.com"))!)
        }
    }
}

#Preview {
    PlayButtonDetailView(key: "")
}
