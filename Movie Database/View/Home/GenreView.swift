//
//  GenreView.swift
//  Movie Database
//
//  Created by Emre Gemici on 21.10.2023.
//

import SwiftUI

struct GenreView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center, spacing: 4){
                //1st Colomn
                VStack(alignment: .leading, spacing: 4){
                    HStack(){
                        Image("action")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                        Spacer()
                        Text("Action")
                    }
                    Divider()
                    HStack(){
                        Image("horror")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                        Spacer()
                        Text("Horror")
                    }
                    Divider()
                    HStack(){
                        Image("mistery")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                        Spacer()
                        Text("Mistery")
                    }
                    Divider()
                    HStack(){
                        Image("romantic")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                        Spacer()
                        Text("Romantic")
                    }
                }
                
                // 2nd Column
                VStack(alignment:.center, spacing: 16){
                    HStack{
                        Divider()
                    }
                    Image(systemName: "popcorn.circle")
                        .font(Font.title.weight(.ultraLight))
                        .imageScale(.large)
                    
                    HStack{
                        Divider()
                    }
                }
                
                // 3rd Column
                VStack(alignment: .trailing, spacing: 4){
                    HStack(){
                        Text("Sci-Fi")
                        Spacer()
                        Image("sci-fi")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                    Divider()
                    HStack(){
                        Text("Fantasy")
                        Spacer()
                        Image("fantasy")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                    Divider()
                    HStack(){
                        Text("Comedy")
                        Spacer()
                        Image("comedy")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                    Divider()
                    HStack(){
                        Text("Animation")
                        Spacer()
                        Image("animation")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                }//: VStack
                
                //4th Column
                
                VStack(alignment:.center, spacing: 16){
                    HStack{
                        Divider()
                    }
                    Image(systemName: "movieclapper")
                        .font(Font.title.weight(.ultraLight))
                        .imageScale(.small)
                    
                    HStack{
                        Divider()
                    }
                }
                
                //5th Column
                VStack(alignment: .trailing, spacing: 4){
                    HStack(){
                        Text("Sci-Fi")
                        Spacer()
                        Image("sci-fi")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                    Divider()
                    HStack(){
                        Text("Fantasy")
                        Spacer()
                        Image("fantasy")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                    Divider()
                    HStack(){
                        Text("Comedy")
                        Spacer()
                        Image("comedy")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                    Divider()
                    HStack(){
                        Text("Animation")
                        Spacer()
                        Image("animation")
                            .resizable()
                            .renderingMode(.template)
                            .modifier(IconModifier())
                    }
                }//: VStack
            }//: HSTACK

        }
        .font(.system(.callout,design: .serif))
        .foregroundColor(Color.gray)
        .frame(maxHeight: 260)
    }
}

struct IconModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 30, height: 30, alignment: .center)
            
    }
}


#Preview(traits :.sizeThatFitsLayout) {
    GenreView()
        .previewLayout(.fixed(width: 410, height: 280))
}
