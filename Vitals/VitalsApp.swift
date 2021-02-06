//
//  Vitals.swift
//  Vitals
//
//  Created by Aayush Pokharel on 05/02/21.
// https://github.com/Aayush9029

import SwiftUI

@main
struct CoursesApp: App {
    @State var showingInitialAlert = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    incrementAppOpenedCount()
                    
                })
                .background(EmptyView()
                                .fullScreenCover(isPresented: $showingInitialAlert, content: {
                                    IntroductionView(isOpen: $showingInitialAlert)
                                    
                                })
            )

        }
    }
    
    
    
    func incrementAppOpenedCount() {
//        Incase we decide to add notifications
//        UIApplication.shared.applicationIconBadgeNumber = 0
        
        guard var appOpenCount = UserDefaults.standard.value(forKey: "App Open Count") as? Int else {
            UserDefaults.standard.set(1, forKey: "App Open Count")
            showingInitialAlert = true
            return
        }
//        showingInitialAlert = true

        
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: "App Open Count")
    }
}
