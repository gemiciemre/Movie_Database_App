//
//  BlurEffectView.swift
//  Movie Database
//
//  Created by Emre Gemici on 25.10.2023.
//

import SwiftUI

struct BlurEffectView: UIViewRepresentable{
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //do nothing
    }
}

#Preview {
    BlurEffectView(style: .systemMaterialDark)
}
