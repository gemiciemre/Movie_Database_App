//
//  Movie.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import Foundation

class Movies: ObservableObject {
    @Published var showingMovie: Bool = false
    @Published var selectedMovie: Movie? = nil
    @Published var movieId: Int = 0
}
