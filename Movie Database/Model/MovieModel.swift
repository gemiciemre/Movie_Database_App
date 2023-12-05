//
//  MovieModel.swift
//  Movie Database
//
//  Created by Emre Gemici on 18.10.2023.
//

import Foundation

struct MovieResponse: Codable{
    let results: [Movie]
}

struct Movie: Codable,Identifiable, Hashable{
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    let originalLanguage: String?
    let tagline: String?
    
    let genres: [MovieGenre]?
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var voteAverageText: String {
        let myDouble = Double(voteAverage)
        let voteAverageText = String(format: "%.1f", myDouble)
        return voteAverageText
    }
    
    var popularityText: String { // NEW STRUCT
        let myPopularity = Double(popularity)
        let popularityText = String(format: "%.1f", myPopularity)
        return popularityText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    var yearText: String {
        guard let releaseDate = self.releaseDate, let date = Utilty.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return Movie.yearFormatter.string(from: date)
    }
    
//    var durationText: String {
//        guard let runtime = self.runtime, runtime > 0 else {
//            return "n/a"
//        }
//        return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
//    }
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            print("DEBUG: Runtime is \(String(describing: self.runtime)) nil or zero")
            return "n/a"
        }

        let hours = Int(runtime / 60)
        let minutes = Int(runtime) % 60

        return String(format: "%02d h %02dm", hours, minutes)
    }
    
    var cast: [MovieCast]? {
        credits?.cast
    }
    
    var crew: [MovieCrew]? {
        credits?.crew
    }
    
    var directors: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    
    var producers: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }

    var movieVideoKey: String{
//        videos?.results[0].key ?? ""
        if let officialTrailer = videos?.results.first(where: { $0.name.contains("Official Trailer") }) {
            let keyOfOfficialTrailer = officialTrailer.key
            return keyOfOfficialTrailer
        } else {
            print("Official Trailer bulunamadı.")
            return ""
        }
    }
    
}


struct MovieGenre: Codable,Identifiable{ // Hashable
    let id: Int
    let name: String
}

struct MovieCredit: Codable {
    
    let cast: [MovieCast]
    let crew: [MovieCrew]
}

struct MovieCast: Codable, Identifiable, Hashable { // Hashable
    let id: Int
    let character: String
    let name: String
    let profilePath: String?
}

struct MovieCrew: Codable, Identifiable {
    let id: Int
    let job: String
    let name: String
}

struct MovieVideoResponse: Codable {
    
    let results: [MovieVideo]
}

struct MovieVideo: Codable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}

