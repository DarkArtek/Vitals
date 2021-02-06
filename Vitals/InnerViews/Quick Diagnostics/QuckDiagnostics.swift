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
    @State var answerd = [String]()
    
    var body: some View {
        VStack{
            HStack{
                Text("Select Your Symptomps")
                    .foregroundColor(Color("Color1"))
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            ForEach(symptoms){symptom in
                SingleQuestion(symptom: symptom, selected_answers: $answerd)
            }
            Spacer()
            
        }.padding()
        
        
        HStack{
            HStack{
                NavigationLink(destination: QuckDiagnosticsResult(answerd: answerd)) {
                    Text("Get Diagnosis")
                }
                
            }
            .foregroundColor(.white)
            .padding(.horizontal, 55)
            .padding(.vertical, 15)
            .background(Color.red .opacity(0.5))
            .cornerRadius(15)
            .shadow(color: Color.red, radius: 5)
            
        }.padding(.leading)
    }
    
}


var possibleOutCome = [
    "Hypertension",
    "Hyperlipidemia",
    "Diabetes",
    "Anxiety",
    "Allergic rhinitis",
    "Reflux esophagiti"
]

struct QuckDiagnosticsResult: View {
    var answerd = [String]()
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                        Text("Diagnoisis")
                            .foregroundColor(Color("Color1"))
                            .font(.title)
                            .fontWeight(.heavy)
                        
                        Spacer(minLength: 0)
                    }
                    .padding()
                    
                    Text("Your Symptoms")
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    ForEach(answerd, id:\.self){a in
                        DiagnoisisReport(answer: a)
                    }
                    
                    Divider().padding(.vertical)
                    Text("Possible Diagnosis")
                        .fontWeight(.bold)
                    ForEach(possibleOutCome, id:\.self){a in
                        DiagnoisisReport(answer: a, color:true)
                    }

                    Spacer()

                    Divider().padding(.vertical)
                    
                    
                    Text("Disclamer: These diagnoistics are based on our Vitals.ai model and your past results they must only be used as a refrence, please consult your physician for full diagnosis")
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                    
                }.padding()
            }
        }
        
    }
}


struct DiagnoisisReport: View {
    var answer: String
    var color = false
    var body: some View {
        VStack {
            
            HStack{
                Text(answer)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                if color{
                    Text("\(Int.random(in: 0..<60))%")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }.padding()
        .background(color ? Color("Color1").opacity(0.5): Color("Color2").opacity(0.5))
        .cornerRadius(25)
        .shadow(color: color ? Color("Color1"): Color("Color2"), radius: color ? 10 : 5)
        
    }
}


struct QuckDiagnostics_Previews: PreviewProvider {
    static var previews: some View {
        QuckDiagnostics()
    }
}




struct SingleQuestion: View {
    @State var symptom: Symptom
    
    @Binding var selected_answers: [String]
    @State var selected = false
    var body: some View {
        VStack {
            
            HStack{
                Image(systemName: selected ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundColor( .white)
                    .shadow(color: .purple, radius:selected ? 10: 0)
                Text(symptom.name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer()
                
                
            }
            
            
        }.padding()
        .background(selected ? Color.green : Color("Color1"))
        .cornerRadius(25)
        .onTapGesture {
            withAnimation {
                selected.toggle()
                selected_answers.append(symptom.name)
                if !selected{
                    //                    Removes item from array if de-selected
                    selected_answers = selected_answers.filter { $0 != symptom.name}
                    
                }
            }
            print(selected_answers)
        }
    }
}
