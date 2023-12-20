//
//  ActivityIndicatorView.swift
//  Movie Database
//
//  Created by Emre Gemici on 26.10.2023.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
