//
//  CleanButtons.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
// https://github.com/Aayush9029
//

import SwiftUI


struct CardButton: View {
    var image: String
    var color: Color
    var body: some View {
        
        Image(systemName: image)
            .foregroundColor(color)
            .padding(5)
            .background(color .opacity(0.2))
            .cornerRadius(5)

            
    }
}


struct SettingsButtons: View {
    var title: String
    var symbol : String
    var color: Color
    @Binding var sheet_toggle_setting: Bool
    
    var body: some View {
        
        Button(action: {
            sheet_toggle_setting = true
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }) {
            
            HStack{
                Image(systemName: symbol)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(Color("black-white"))
                Image(systemName:"chevron.right")
                    .padding(.leading)
                    .foregroundColor(Color("black-white"))
                
            }
            .padding(10)
        }
        .background(LinearGradient(Color("color-top"),Color("color-bottom"))
                        .cornerRadius(15)
                        .shadow(color: Color("black-white-shadow").opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color:  Color("white-black-shadow").opacity(0.7), radius: 10, x: -5, y: -5)
        )
        
        .padding([.horizontal, .top], 5)
        
        
    }
}
