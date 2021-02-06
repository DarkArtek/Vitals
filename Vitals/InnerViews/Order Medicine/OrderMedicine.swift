//
//  OrderMedicine.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
// https://github.com/Aayush9029

import SwiftUI

struct OrderMedicine: View {
    var medicines = ["Synthroid", "Methadose", "Apo-Atorvastatin", "Jamp-Vitamin D", "Sandoz-Amlodopine", "Apo-Rosuvastatin"]
    @State var ordered = [""]
    
    @State var ordersString = ""
    
    @State var showingAlert: Bool = false
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Order your prescriptions")
                    .foregroundColor(Color("Color1"))
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
            }
            .padding()
            HStack {
                VStack(alignment: .leading, spacing: 10){
                ForEach(medicines, id:\.self){ m in
                    SingleMedicine(name: m, num: Int.random(in: 2..<5), ordered: $ordered)
                }
                }
                Spacer()
            }.padding(.horizontal)
            Spacer()
        }.padding(.top)
        
            HStack{
              HStack{
                  Image(systemName:"cart.circle")
                  Text("Order")
              }
              .foregroundColor(.white)
              .padding(.horizontal, 20)
              .padding(.vertical, 15)
              .background(Color.green .opacity((ordered.count > 1) ? 0.85 : 0.25))
              .cornerRadius(15)
              .shadow(color: Color.green, radius: 5)
              .onTapGesture {
                showingAlert.toggle()
                ordersString = ""
                for order in ordered{
                    ordersString  += order
                    ordersString += " | "
                }
              }
            
    }

    .alert(isPresented: $showingAlert) {
        if ordered.count > 1{
            return Alert(title: Text("Purchase Successful"), message: Text(ordersString), dismissButton: .default(Text("Got it!")))
        }else{
            return Alert(title: Text("Select At least 1 item"), message: Text("You must add at least 1 item"), dismissButton: .default(Text("Got it!")))
        }
    }
}

}



struct SingleMedicine: View {
    @State var name = "Synthroid"
    var num: Int
    @Binding var ordered: [String]
    @State var selected = false
    var body: some View {
        VStack {
            HStack{
                Image(systemName: selected ? "pills.fill" : "pills")
                    .foregroundColor( selected ? .white : .purple)
                    .shadow(color: .purple, radius:selected ? 10: 0)
            Text(name)
                .foregroundColor(.white)
                .fontWeight(.bold)
                
                Spacer()
            Text("x\(num)")
                .foregroundColor(.white)
                .fontWeight(.bold)

            }
            
            
        }.padding()
        .background(Color("Color1").opacity(selected ? 0.75: 0.5))
        .cornerRadius(25)
        .onTapGesture {
            withAnimation {
                selected.toggle()
                ordered.append(name)
                if !selected{
//                    Removes item from array if de-selected
                    ordered = ordered.filter { $0 != name}

                }
            }
        }
    }
}
