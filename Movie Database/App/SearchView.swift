//
//  SearchView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchMovie: String = ""
    
    var body: some View {
        Text("Search View")
//        NavigationView {
//            List() { trail in
//                NavigationLink(destination: DetailView(trail: trail)) {
//                    TrailRow(trail: trail)
//                }
//            }
//            .navigationBarTitle("Hiking Trails")
//        }
//        .searchable(text: $searchMovie)
    }
}

#Preview {
    SearchView()
}
