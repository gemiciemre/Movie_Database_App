//
//  FooterView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center,spacing: 10){
            Text("We offer you Movie Database and all movies you are looking for are in this application. It able to search and add to your lists.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
                .padding()
            
            
            ZStack {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: 110)
                    .foregroundStyle(Color("ColorText"))
                Image("logo")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .layoutPriority(0)
            }
                            
            Text("Copyright © Emre & Seda GEMİCİ \nAll right reserved")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
                .padding()
        }
    }
}

#Preview {
    FooterView()
        .background(Color("ColorBackground"))
}
