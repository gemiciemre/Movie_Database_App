//
//  HeaderDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct HeaderDetailView: View {
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6){
            HStack(alignment: .center,spacing: 6){
                IMDBView()
                
                RatingView()
                
                ReviewCountView()
                
            }
            Text("Film Name")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.vertical,6)
            
            DateInfoView()
            
            GenderHeaderView()
                .padding(.vertical,6)
                
        }
        .foregroundStyle(.white)
    }
}

#Preview(traits:.sizeThatFitsLayout) {
    HeaderDetailView()
        .padding()
        .background(Color.black)

}
