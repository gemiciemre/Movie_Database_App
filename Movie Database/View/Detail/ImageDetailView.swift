//
//  ImageDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct ImageDetailView: View {
    var body: some View {
        Image("oppenheimer")
            .resizable()
            .scaledToFill()
            .frame(height: 420)
    }
}

#Preview {
    ImageDetailView()
}
