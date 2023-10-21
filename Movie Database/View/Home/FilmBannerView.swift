//
//  FilmBannerView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct FilmBannerView: View {
    
    let banner: Banner
    
    var body: some View {
        Image(banner.image)
            .resizable()
            .scaledToFill()
            .frame(width: 370,height: 280)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
    }
}

#Preview {
    FilmBannerView(banner: banners[0])
}
