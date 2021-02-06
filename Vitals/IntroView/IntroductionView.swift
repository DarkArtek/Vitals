//
//  IntroductionView.swift
//  Vitals
//
//  Created by Aayush Pokharel on 05/02/21.
// https://github.com/Aayush9029
import SwiftUI

struct IntroductionView: View {
    @Binding var isOpen: Bool
       
       var body: some View {
           ScrollView(showsIndicators: true){
               VStack(alignment: .center) {
                   Spacer()
                   TitleView()
                   InformationContainerView()
                   Spacer(minLength: 30)
                   Button(action: {
                     let generator = UINotificationFeedbackGenerator()
                     generator.notificationOccurred(.success)
                       isOpen = false
                 }) {
                     Text("Continue")
                         .customButton()
                 }
                 .padding(.horizontal)


               }
           }.background(LinearGradient(Color("color-top"),Color("color-bottom")).ignoresSafeArea(.all, edges: .all))

       }
    
    
    
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(isOpen: .constant(true))
    }
}
