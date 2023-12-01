//
//  MovieDetailState.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

class MovieDetailState: ObservableObject {
    
    private let movieService: MovieService
    @Published var movie: Movie?
    @Published var isLoading = false //true
    @Published var error: NSError?
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.error = nil //added later
        
        self.movieService.fetchMovie(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}

