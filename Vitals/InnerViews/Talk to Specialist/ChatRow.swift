//
//  ChatRow.swift
//  Global Chat
//
//  Created by Balaji on 12/09/20.
//

import SwiftUI

struct ChatRow: View {
    var chat : String
    var body: some View {
//        Would probably be better if we had a proper view model, but this is only for demo purposes
        HStack(spacing: 15){
            
            if (chat != "Mind telling me what you ate before bed?" && chat != "Interesting... I wonder what caused the stomach ache!"){
            
            // NickName View...
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5, content: {
                
                Text(chat)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                // Custom Shape...
                    .clipShape(ChatBubble(myMsg: true))
                
                Text(Date(),style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.leading)
            })
            .padding(.horizontal)
                NickName(name: "Linus")
                    .padding(.trailing)


            
            }else{
                // NickName View...
                NickName(name: "Ali")

                Spacer()
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text(chat)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                    // Custom Shape...
                        .clipShape(ChatBubble(myMsg: false))
                    
                    Text(Date(),style: .time)
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .padding(.leading )
                }).padding(.horizontal)

            }
        }
    }
}

struct NickName : View {
    
    var name : String
    
    var body: some View{
        
        
        if name == "Linus"{
        
        Text(String(name.first!))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .background((name == "Linus" ? Color.green : Color.blue).opacity(0.5))
            .clipShape(Circle())
            // COntext menu For Name Display...
            .contentShape(Circle())
            .contextMenu{
                
                Text("Linus Sebasitian")
                    .fontWeight(.bold)
            }.padding(.leading)
        }else{
            Text(String("A"))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background((name == "Linus" ? Color.green : Color.blue).opacity(0.5))
                .clipShape(Circle())
                // COntext menu For Name Display...
                .contentShape(Circle())
                .contextMenu{
                    
                    Text("Dr. Ali")
                        .fontWeight(.bold)
                }.padding(.leading)
        }
    }
}
