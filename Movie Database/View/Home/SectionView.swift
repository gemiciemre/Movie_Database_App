//
//  SectionView.swift
//  Movie Database
//
//  Created by Emre Gemici on 9.12.2023.
//

import SwiftUI

struct SectionView: View {
    @State var rotateClockwise : Bool
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            
            Text("Genres".uppercased())
                .font(.custom("Gotham-Bold", size: 13))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
            
            Spacer()
        }//: VSTACK
        .background(Color("ColorIMDB").cornerRadius(12))
        .frame(width: 70)
    }
}

#Preview(traits:.sizeThatFitsLayout){
    SectionView(rotateClockwise: true)
        .previewLayout(.fixed(width: 120, height: 240))
        .padding()
        .background(colorBackground)
}
