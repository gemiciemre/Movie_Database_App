//
//  MovieOverviewView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct MovieOverviewView: View {
    var body: some View {
        Text("After he and his wife are murdered, marine Ray Garrison is resurrected by a team of scientists. Enhanced with nanotechnology, he becomes a superhuman, biotech killing machine—'Bloodshot'. As Ray first trains with fellow super-soldiers, he cannot recall anything from his former life. But when his memories flood back and he remembers the man that killed both him and his wife, he breaks out of the facility to get revenge, only to discover that there's more to the conspiracy than he thought.")
            .font(.system(.footnote,design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundStyle(Color.white)
    }
}

#Preview {
    MovieOverviewView()
        .background(Color.gray)
}
