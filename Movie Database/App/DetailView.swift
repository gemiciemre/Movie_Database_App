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
                ImageDetailView()
                NavigationBarDetailView()
                    .padding(.horizontal)
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0,y: 5)
                    .offset(y: -180)
                    
                
            }
            Spacer()
            VStack(alignment: .leading,spacing: 0){
                ScrollView(.vertical,showsIndicators: false) {
                    HStack {
                        HeaderDetailView()
                            .padding(.top)
                        Spacer()
                    }
                    PlayButtonDetailView()
                        .padding(.horizontal)
                        .padding()
                    MovieOverviewView()
                        .padding(.vertical)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.secondary)
                        .padding(.vertical)
//                    Text("Top Cast")
//                        .font(.title3.bold())
//                        .padding(.bottom,5)
//                        .padding(.trailing,250)
//                        .foregroundStyle(.white)
//                    
                    TopCastsView()
                }
                Spacer()
            }
            .padding(.horizontal)
            .frame(width:400)
            .background(BlurEffectView(style: .dark).padding(.top,-50))
            .clipShape(CustomShapeDetailView())
            
            
        }
        //.zIndex(0)
        .ignoresSafeArea(.all,edges: .all)
        .background(Color.black)
    }
}

#Preview {
    DetailView()
}

