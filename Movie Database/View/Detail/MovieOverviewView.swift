//
//  MovieOverviewView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct MovieOverviewView: View {
    let overview: String
    
    var body: some View {
        Text(overview)
            .font(.system(.footnote,design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.white)
    }
}

#Preview {
    MovieOverviewView(overview: movieSample.overview)
        .background(Color.gray)
}
