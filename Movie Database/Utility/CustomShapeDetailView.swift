//
//  CustomShapeDetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct CustomShapeDetailView: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 100))
        return Path(path.cgPath)
    }
}



#Preview(traits: .sizeThatFitsLayout) {
    CustomShapeDetailView()
        .previewLayout(.fixed(width: 428, height: 120))
        .padding()
}


