//
//  NavigationBarDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct NavigationBarDetailView: View {
    var body: some View {
        HStack{
            Button{
                withAnimation(.easeIn){
                    //some codes
                }
            }label: {
                Image(systemName: "chevron.left.circle")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button{
                //Some Action
            }label: {
                Image(systemName: "heart.circle")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    NavigationBarDetailView()
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
}
