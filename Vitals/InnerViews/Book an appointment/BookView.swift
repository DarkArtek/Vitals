//
//  BookView.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
//

import SwiftUI

struct BookView: View {
    @AppStorage("aptDate") var aptDate: String = ""
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
//        formatter.dateStyle = .full
        return formatter
    }

    @State private var appointmentDate = Date()

    var body: some View {
        VStack {
            HStack {
                Text("Book Appointment")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.leading)
            VStack {
                DatePicker("Select a date: ", selection: $appointmentDate, in: Date()...)
                    .datePickerStyle(GraphicalDatePickerStyle())
                }
                .padding()
                HStack{
                  HStack{
//                          Image(systemName:"arrow.left")
                      Text("Book Appointment")
                  }
                  .foregroundColor(.white)
                  .padding(.horizontal, 20)
                  .padding(.vertical, 15)
                  .background(Color.green .opacity(0.85))
                  .cornerRadius(15)
                  .shadow(color: Color.green, radius: 5)
                  .onTapGesture {
                    aptDate =  "\(appointmentDate)"
                  }
    
                    
                    if aptDate != ""{
                        HStack{
      //                          Image(systemName:"arrow.left")
                            Text("Cancel Appointment")
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(Color.red .opacity(0.85))
                        .cornerRadius(15)
                        .shadow(color: Color.red, radius: 5)
                        .onTapGesture {
                            aptDate = ""
                        }
                    }
                    
                }.padding(.vertical)

                if aptDate != ""{
                Text("Appointment Booked for: \(appointmentDate, formatter: dateFormatter)")
                    .padding(.top)
                }
            }
        
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
