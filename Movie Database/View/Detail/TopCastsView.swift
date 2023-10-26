//
//  TopCastsView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import SwiftUI

struct TopCastsView: View {
    
    let topCast: [String] = ["CillianMurphy","EmilyBlunt","MattDemon","RobertDowney"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(topCast, id: \.self){ item in
                    HStack{
                        Image(item)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50,height: 90)
                            .clipShape(Capsule())
                        VStack(alignment:.leading){
                            Text("Chillan Murphy")
                                .foregroundStyle(.white)
                                .font(.headline)
                            Text("Character Name")
                                .foregroundStyle(.secondary)
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
