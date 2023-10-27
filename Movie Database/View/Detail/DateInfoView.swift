//
//  DateInfoView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct DateInfoView: View {
    
    var category: String
    var year: String
    var duration: String
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Text(category)
                .font(.system(.footnote, design: .rounded))
                .frame(width: 50)
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
            Text(year)
                .font(.system(.footnote, design: .rounded))
                .frame(width: 50)
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
            Text(duration)
                .font(.system(.footnote, design: .rounded))
                .frame(width: 50)
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DateInfoView(category: "category", year: "2023" , duration: "2h 30m")
        .background(Color.white)
}
