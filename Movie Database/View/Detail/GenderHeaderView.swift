//
//  GenderHeaderView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct GenderHeaderView: View {
    
    let genders: [String] = ["Action", "Comedy", "Drama"]
    
    var body: some View {
        HStack {
            ForEach(genders, id: \.self){ item in
                if item != nil {
                    Circle()
                        .frame(width: 5 ,height: 5)
                        .foregroundStyle(Color("ColorIMDB"))
                }
                Text(item)
                    .font(.system(.headline,design: .rounded))
                    .fontWeight(.light)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GenderHeaderView()
}
