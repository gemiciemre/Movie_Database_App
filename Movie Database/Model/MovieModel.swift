//
//  MovieModel.swift
//  Movie Database
//
//  Created by Emre Gemici on 18.10.2023.
//

import Foundation

struct MovieResponse: Decodable{
    let results: [Movie]
}

struct Movie: Decodable{
    let id: Int
    let title: String
    let backdropPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runTime: Int?
}
