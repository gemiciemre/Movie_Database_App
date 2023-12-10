//
//  GenreModel.swift
//  Movie Database
//
//  Created by Emre Gemici on 9.12.2023.
//

import Foundation

struct Genre : Codable, Identifiable{
    let id: Int
    let name: String
    let image: String
}
