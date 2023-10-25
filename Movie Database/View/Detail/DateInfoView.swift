//
//  DateInfoView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct DateInfoView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Text("PG-13")
                .font(.system(.footnote, design: .rounded))
                .frame(width: 50)
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
            Text("2022")
                .font(.system(.footnote, design: .rounded))
                .frame(width: 50)
                .fontWeight(.regular)
                .foregroundStyle(Color.white)
                .padding(.horizontal,6)
                .padding(.vertical,3)
                .background(Color.gray.opacity(0.5))
                .clipShape(Capsule())
            Text("2h 58m")
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
    DateInfoView()
        .background(Color.white)
}
