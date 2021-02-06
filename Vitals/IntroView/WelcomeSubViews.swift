//
//  WelcomeSubView.swift
//  Vitals
//
//  Created by Aayush Pokharel on 05/02/21.
// https://github.com/Aayush9029

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Welcome to")
                .customTitleText()

            Text("Vitals")
                .customTitleText()
                .foregroundColor(.mainColor)
        }.padding()
    }
}

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {

            InformationDetailView(title: "Quick Diagnostics", subTitle: "Quickly Get Diagnosis based on your symptoms.", imageName: "heart")

            InformationDetailView(title: "Talk to Specialist", subTitle: "Chat with a specialist anytime anywhere.", imageName: "person.circle")

            InformationDetailView(title: "Past Vitals", subTitle: "Take a look at your past vitals to see what you need to take care.", imageName: "tag.circle")
            
            InformationDetailView(title: "Book an appointment", subTitle: "Quickly book an appointment with a specialist", imageName: "calendar.badge.clock")
            
            InformationDetailView(title: "Order Medicine", subTitle: "Ran out of your prescriptions, or need a re-fill order medicine.", imageName: "pills")
            
            InformationDetailView(title: "Talk to EDITH", subTitle: "An Ai based personal health assistant can assist with your questions.", imageName: "face.smiling")

        }
        .padding(.horizontal)
    }
}


struct InformationDetailView: View {
    var title: String = ""
    var subTitle: String = ""
    var imageName: String = ""
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}




struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .shadow(color: .mainColor, radius: 5)
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    static var mainColor =  Color("Color1")

}
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
