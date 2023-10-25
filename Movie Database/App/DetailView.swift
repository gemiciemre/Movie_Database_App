//
//  DetailView.swift
//  Movie Database
//
//  Created by Emre Gemici on 22.10.2023.
//

import SwiftUI

struct DetailView: View {
    
    var body: some View {
        VStack(alignment: .center,spacing: 0){
            ZStack {
                NavigationBarDetailView()
                    .padding(.horizontal)
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                Image("oppenheimer")
                    .resizable()
                    .scaledToFit()
            }
            VStack(alignment: .leading,spacing: 0){
                HStack {
                    HeaderDetailView()
                    Spacer()
                }
            }
            .padding(.horizontal)
            .frame(width:400)
            .background(
                Color.black.clipShape(CustomShapeDetailView()).padding(.top,-50)
            
            )
            
        }
        .zIndex(0)
        .ignoresSafeArea(.all,edges: .all)
        .background(Color.black)
    }
}

#Preview {
    DetailView()
}

