//
//  Constant.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

// DATA

let banners: [Banner] = Bundle.main.decodeNew("banner_image.json")
let movieSample: Movie = Bundle.main.decodeNew("movie_info.json")
let genres : [Genre] = Bundle.main.decodeNew("genre_list.json")

//COLOR
let colorBackground : Color = Color("ColorBackground")
let colorGray : Color = Color(UIColor.systemGray)


// LAYOUT
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10

var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 2)
}
var gridLayoutFavoriteItem: [GridItem] {
    return Array(repeating: GridItem(.flexible(),spacing: rowSpacing), count: 3)
}


//STRUCT

class ViewFrame: ObservableObject {
    var startingRect: CGRect?
    
    @Published var frame: CGRect {
        willSet {
            if startingRect == nil {
                startingRect = newValue
            }
        }
    }
    
    init() {
        self.frame = .zero
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        GeometryReader { geometry in
            AnyView(Color.clear)
                .preference(key: RectanglePreferenceKey.self, value: geometry.frame(in: .global))
        }.onPreferenceChange(RectanglePreferenceKey.self) { (value) in
            self.rect = value
        }
    }
}

struct RectanglePreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}



class Favorite: ObservableObject{
    
    @Published var favoriteMovieIDs: Set<Int> = []
    
    //: Buradaki init sayesinde array sıfırlanmıyor.
    init() {
           loadFavoriteMovieIDs()
       }
    
    func toggleFavorite(movieID: Int){
        if favoriteMovieIDs.contains(movieID){
            favoriteMovieIDs.remove(movieID)
        }else{
            favoriteMovieIDs.insert(movieID)
        }
        saveFavoriteMovieIDs()
    }
    
    func loadFavoriteMovieIDs(){
        if let favoriteIDs = UserDefaults.standard.array(forKey: "favoriteMovieIDs") as? [Int]{
            favoriteMovieIDs = Set(favoriteIDs)
        }
    }
        
    func saveFavoriteMovieIDs(){
        print("SaveFavorite Funciton Called.")
        UserDefaults.standard.set(Array(favoriteMovieIDs), forKey: "favoriteMovieIDs")
        print("Saved to UserDefaults")
        
    }
}
