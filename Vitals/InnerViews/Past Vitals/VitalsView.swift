//
//  VitalsView.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-06.
//

import SwiftUI
import SwiftUICharts

struct VitalsView: View {
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Text("Your Vitals")
                        .foregroundColor(Color("Color1"))
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer(minLength: 0)
                    Text("Till Date")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                }
                .padding()
                HStack{
                    MultiLineChartView(data: [([8,32,11,23,40,28], GradientColors.green), ([90,99,78,111,70,60,77], GradientColors.purple), ([34,56,72,38,43,100,50], GradientColors.orngPink)], title: "Blood", legend: "RBC, WBC & Plat", rateValue: 13)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(5)
                          
                          LineChartView(data: [35, 26, 47, 96, 30, 77, 12, 41, 14, 61, 10, 21, 48, 2, 93].shuffled(), title: "O2", legend: "Saturation",rateValue: -5) // legend is optional
                            .clipped()
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(5)
                    }.padding()
                HStack{
                    LineChartView(data: [11, 49, 93, 47, 3, 78, 35, 14, 9, 96, 67, 26, 83, 19, 41].shuffled(), title: "MCV", legend: "Mean Corpuscular hemoglobin concentration", rateValue: 2) // legend is optional
                        .clipped()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(5)
                    
                    LineChartView(data:[29, 34, 76, 1, 56, 84, 35, 80, 55, 68, 91, 8, 53, 88, 77].shuffled(), title: "CBC", legend: "Complete blood count",rateValue: -9) // legend is optional
                        .clipped()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(5)
                }.padding(22)
            }
            
            VStack{
                HStack{
                    LineChartView(data: [11, 49, 93, 47, 3, 78, 35, 14, 9, 96, 67, 26, 83, 19, 41].shuffled(), title: "RDW", legend: "Red blood cell distribution") // legend is optional
                        .clipped()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(5)
                    
                    LineChartView(data:[29, 34, 76, 1, 56, 84, 35, 80, 55, 68, 91, 8, 53, 88, 77].shuffled(), title: "MCHC", legend: "Corpuscular Hemoglobin ") // legend is optional
                        .clipped()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(5)
                }.padding(22)
            }
            Text("Library used: SwiftUICharts").foregroundColor(.gray).font(.subheadline)
            
        }
    }
}

struct VitalsView_Previews: PreviewProvider {
    static var previews: some View {
        VitalsView()
    }
}
