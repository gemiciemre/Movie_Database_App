//
//  NavigationBarView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        HStack{
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0 , y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
        }
    }
}

#Preview {
    NavigationBarView()
}
