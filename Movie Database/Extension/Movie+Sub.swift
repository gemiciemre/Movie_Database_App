//
//  Movie+Sub.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import Foundation
extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utilty.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
    
    
    func decodeNew<T:Codable> (_ file: String) -> T {
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle. Bundle URL: \(self.bundleURL)")
        }
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        // 3. Create a decoder
        let jsonDecoder = Utilty.jsonDecoder
        // 4. Create a property for the decoded data,
        
//        guard let loaded = try? decoder.decode(T.self, from: data)else{
//            fatalError("Failed to decode \(file) from bundle.")
//        }
        
        do {
            let loaded = try jsonDecoder.decode(T.self, from: data)
            return loaded
        } catch {
            print("Decoding error: \(error)")
            fatalError("Could not decode \(file) from bundle.")
        }

        // 5. Return the ready-to-use data
//        return loaded
    }
    
    
}



//extension MovieSection {
//    
//    static var stubs: [MovieSection] {
//        
//        let stubbedMovies = Movie.stubbedMovies
//        return MovieListEndpoint.allCases.map {
//            MovieSection(movies: stubbedMovies.shuffled(), endpoint: $0)
//        }
//    }
//    
//}
