//
//  QuckDiagnostics.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
//

import SwiftUI

struct Symptom:Identifiable {
    
    var id = UUID().uuidString
    var name: String
    var scale: Int
    
}

var symptoms = [
    Symptom(name: "Head Ache", scale: 0),
    Symptom(name: "Stomace Ache", scale: 0),
    Symptom(name:  "Heart Burn", scale: 0),
    Symptom(name: "Dizzyness", scale: 0),
    Symptom(name: "Shortness of breath", scale: 0)
    
]



struct QuckDiagnostics: View {
    @State var answerd = [""]
    
    var body: some View {
        ForEach(symptoms){symptom in
            SingleQuestion(symptom: symptom, ordered: $answerd)
        }
    }
}

struct QuckDiagnostics_Previews: PreviewProvider {
    static var previews: some View {
        QuckDiagnostics()
    }
}




struct SingleQuestion: View {
    @State var symptom: Symptom
    
    @Binding var ordered: [String]
    @State var selected = false
    var body: some View {
        VStack {
            HStack{
                Image(systemName: selected ? "pills.fill" : "pills")
                    .foregroundColor( selected ? .white : .purple)
                    .shadow(color: .purple, radius:selected ? 10: 0)
                Text(symptom.name)
                .foregroundColor(.white)
                .fontWeight(.bold)
                
                Spacer()
                

            }
            
            
        }.padding()
        .background(Color("Color1").opacity(selected ? 0.75: 0.5))
        .cornerRadius(25)
        .onTapGesture {
            withAnimation {
                selected.toggle()
                ordered.append(symptom.name)
                if !selected{
//                    Removes item from array if de-selected
                    ordered = ordered.filter { $0 != symptom.name}

                }
            }
        }
    }
}
