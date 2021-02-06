//
//  Chat.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
//

import SwiftUI

struct ChatView: View {
    
    @State var messages = ["Yesterday i couldn't sleep all night and my stomach had this very painful sting","Mind telling me what you ate before bed?"]
    
    @State var message = ""
    
    var body: some View {
        VStack(spacing: 0){
            
            HStack{
                Text("Dr. Ali")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
            }
            .padding()
                
                ScrollView{
                    
                    VStack(spacing: 15){
                        
                        ForEach(messages, id:\.self){msg in
                            
                            ChatRow(chat: msg)
                        }
                    }
                    .padding(.vertical)
                }
            
            HStack(spacing: 15){
                
                TextField("Enter Message", text: $message)
                    .padding(.horizontal)
                    // Fixed Height For Animation...
                    .frame(height: 45)
                    .clipShape(Capsule())
                
                if (message != ""){
                    
                    Button(action: {
                        self.messages.append(message)
                        message = ""
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            self.messages.append("Interesting... I wonder what caused the stomach ache!")
                        }
                    }, label: {
                        
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.blue)
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    })
                }
            }
            .animation(.default)
            .padding()
        }    }
}
