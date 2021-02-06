//
//  TextShimmer.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-05.
//  https://github.com/Aayush9029

import SwiftUI



struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    @State var multiColors = false

    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(.system(size: 44, weight: .bold))
                .foregroundColor(Color("Color1"))
            
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 44, weight: .bold))
                        .foregroundColor(multiColors ? randomColor() : Color.white.opacity(0.5))
                }
            }
            // Masking For Shimmer Effect...
            .mask(
            
                Rectangle()
                    
                    .fill(
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -200)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
            
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
        }
    }
    
    func randomColor()->Color{
        
        let color = UIColor(red: 1, green: .random(in: 0...0.75), blue: .random(in: 0...0.75), alpha: 1)
        
        return Color(color)
    }
}
