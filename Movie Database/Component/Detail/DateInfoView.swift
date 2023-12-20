//
//  DateInfoView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct DateInfoView: View {
    
    var language: String
    var year: String
    var duration: String
    
    init(language: String, year: String, duration: String) {
        self.language = language
        self.year = year
        self.duration = duration
    }
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Text(language.uppercased())
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
            Text(year)
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
            Text(duration)
                .font(.system(.footnote, design: .rounded))
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
    DateInfoView(language: "language", year: "000" , duration: "0h 00m")
        .background(Color.white)
}
