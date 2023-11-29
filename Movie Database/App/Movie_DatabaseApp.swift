//
//  Movie_DatabaseApp.swift
//  Movie Database
//
//  Created by Emre Gemici on 18.10.2023.
//

import SwiftUI

@main
struct Movie_DatabaseApp: App {
    var body: some Scene {
        WindowGroup {
            DetailView(movie: movieSample)
        }
    }
}
