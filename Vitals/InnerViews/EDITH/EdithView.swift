//
//  EdithView.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
// https://github.com/Aayush9029

import SwiftUI
import AVFoundation

struct EdithView: View {
    var greetings = ["Hey, how are you doing?", "It's a pleasure to meet you again.", "It's good to see you again","What's up?", "Is there something you want to talk about today?"]
    let synthesizer = AVSpeechSynthesizer()
    @State private var shouldAnimate = true
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    
                    if shouldAnimate{
                        PulseView()
                            .onAppear(perform: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    shouldAnimate = false
                                }
                            })
                    }
                    else{
                        
                        Image(systemName: "face.smiling")
                            .font(.system(size: 64))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple.opacity(0.85))
                            .clipShape(Circle())
                            .shadow(color: Color.purple, radius: 15)
                            
                            .onTapGesture {
                                shouldAnimate = true
                            }
                    }
                    
                    
                    
                }
                
            }.padding(.leading)
            TextShimmer(text: "Hey, Linus!", multiColors: true)
                .padding(.top)
                .onAppear(perform: {
                    let utterance = AVSpeechUtterance(string: greetings.randomElement()!)
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    utterance.rate = 0.5
                    synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
                    synthesizer.speak(utterance)
                })
        }
        
    }
}

struct EdithView_Previews: PreviewProvider {
    static var previews: some View {
        EdithView()
    }
}
