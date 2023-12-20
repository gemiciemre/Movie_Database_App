//
//  TopCastsView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct TopCastsView: View {
    
    let casts: [MovieCast] 
    
    init(casts: [MovieCast]? = nil) {
        self.casts = casts ?? [
            MovieCast(
                id: 12835,
                character: "Character Name",
                name: "Artist Name",
                profilePath: ""
            )
        ]
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(casts.prefix(9), id: \.self){ item in
                    HStack{
                        AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(item.profilePath ?? "/7rwSXluNWZAluYMOEWBxkPmckES.jpg" )")!) { phase in
                              switch phase {
                              case .empty:
                                  Image(systemName: "photo")
                                      .frame(width: 60, height: 80)
                              case .success(let image):
                                  image.resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .frame(maxWidth: 50, maxHeight: 73)
                              case .failure:
                                  Image(systemName: "photo")
                                      .frame(width: 50, height: 73)
                              @unknown default:
                                  EmptyView()
                                      .frame(width: 50, height: 73)
                              }
                          }
                        .frame(width: 50, height: 73)
                          .clipShape(Capsule())
                        
                        VStack(alignment:.leading){
                            Text(item.name)
                                .foregroundStyle(.white)
                                .font(.headline)
                            Text(item.character)
                                .foregroundStyle(Color("ColorText"))
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TopCastsView()
        .background(Color.gray)
}
