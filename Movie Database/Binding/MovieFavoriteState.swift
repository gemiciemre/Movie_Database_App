//
//  MovieFavoriteState.swift
//  Movie Database
//
//  Created by Emre Gemici on 8.12.2023.
//

import SwiftUI
import UIKit
import Combine

private let _imageCache = NSCache<AnyObject, AnyObject>()

class MovieFavoriteState: ObservableObject{
    
    private let movieService: MovieService
    @Published var movie: Movie?
    @Published var isLoading = false
    @Published var error: NSError?
    @Published var image: UIImage?
    
    var imageCache = _imageCache
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int){
        
        self.movieService.fetchMovie(id: id){[weak self] (result) in
            guard let self = self else {return}
            print("5")
            switch result {
            case.success(let movie):
                self.movie = movie
                print("6")
            case.failure(let error):
                self.error = error as NSError
            }
        }
    }
    
    
    func loadImage(){
        print("7")
        let url = movie!.posterURL
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
