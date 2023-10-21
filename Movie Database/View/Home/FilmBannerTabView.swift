//
//  FilmBannerTabView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct FilmBannerTabView: View {
    var body: some View {
        TabView{
            ForEach(banners){ item in
                FilmBannerView(banner: item)
                    .padding(.top,10)
                    .padding(.horizontal,15)
            }
        }//: TAB VIEW
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    FilmBannerTabView()
        .background(Color.gray)
}
