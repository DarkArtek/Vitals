//
//  Vitals.swift
//  Vitals
//
//  Created by Aayush Pokharel on 05/02/21.
// https://github.com/Aayush9029

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
@State private var problem = false
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true

                    } else {
                        problem = true
                        // there was a problem
                    }
                }
            }
        }else {
            self.isUnlocked = true
        }
    }
    
    var body: some View {
        NavigationView{
            if isUnlocked{
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }else{
                ZStack{
                    Color("top-background")
                VStack{
                    VStack{
                        Image(systemName: "bolt.heart")
                            .font(.system(size: 128))
                            .foregroundColor(Color.pink.opacity(0.85))
                            .shadow(color: Color.pink.opacity(0.5), radius: 15)
                            .padding(.bottom)
                        
                        Text("Welcome to Vitals")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Hospital at your fingertips")
                            .font(.title2)
                        Divider()

                    }.foregroundColor(Color("Color1"))
                    Spacer()
                    VStack{
                        PulseViewFace()
                        .shadow(color: .blue, radius: 10 )
                        .padding(.top, 50)
                        .onTapGesture {
                            authenticate()
                        }
                        Text("Tap the image to authenticate!").padding(.top)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(didyouknows.randomElement()!)
                        .font(.subheadline)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                        .padding()
                }
                }
            }
        }
    }
}

//Did you know is kinda reduntant as it's repeating but might add new facts and or jokes

var didyouknows = ["Did you know? You can easily talk to your physician via the app", "Did you know? You can refill your prescriptions","Did you know? You can book an appointment through the app", "Did you know? You can talk to our Ai Powered Nurse?","Did you know? Optimism may help you live longer.", "Did you know? Cholesterol-free can be bad for your cholesterol"]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabView : View {
    
    @State var selectedTab = "house"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            // Using Tab View For Swipe Gestures...
            // if you dont need swipe gesture tab change means just use switch case....to switch views...
            
            TabView(selection: $selectedTab) {
                
                Home()
                    .tag("house")
                
                Email()
                    .tag("envelope.fill")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            // for bottom overflow...
            
            HStack(spacing: 0){
                
                ForEach(tabs,id: \.self){image in
                    
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                }
            }
            .padding(.horizontal,20)
            .padding(.vertical,5)
            .background(Color("tabcolor"))
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            // for smaller iphones....
            // elevations...
            .padding(.bottom,edge!.bottom == 0 ? 20 : 0)
            
            // ignoring tabview elevation....
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}

// tabs...
// Image Names...
var tabs = ["house","envelope.fill"]

struct TabButton : View {
    
    var image : String
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = image}) {
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(selectedTab == image ? Color("tab") : Color.gray)
                .padding()
        }
    }
}

struct Home : View {
    
    //    @State var txt = ""
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    @State var isProfile = false
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    TextShimmer(text:  "Hello Linus")
                    
                    Text("Welcome to vitals!")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top, -5)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    
                    Image("profile")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .onTapGesture {
                            isProfile.toggle()
                        }
                        .background(EmptyView()
                                        .fullScreenCover(isPresented: $isProfile, content: {
                                            ProfileView(isOpened: $isProfile)
                                            
                                        })
                        )
                    
                    
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    HStack{
                        
                        Text("Quick Actions")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer(minLength: 0)
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2),spacing: 20){
                        
                        ForEach(actions){action in
                            //                            QuickActions(name: "Quick Diagnostics", numCourse: 12,asset: "Diagnostics"),
                            //                            QuickActions(name: "Talk to specialist", numCourse: 12,asset: "specialist"),
                            //                            QuickActions(name: "Past Vitals", numCourse: 12,asset: "vitals"),
                            //                            QuickActions(name: "Book an appointment", numCourse: 12,asset: "appointment"),
                            //                            QuickActions(name: "Order medicine", numCourse: 12,asset: "medicine"),
                            //                            QuickActions(name: "Talk to EDITH", numCourse: 12,asset: "edith")
                            
                            if (action.name == "Talk to specialist"){
                                NavigationLink(destination: ChatView()) {
                                    
                                    ActivityCardView(action: action)
                                }
                            }
                            else if action.name == "Book an appointment"{
                                NavigationLink(destination: BookView()) {
                                    
                                    ActivityCardView(action: action)
                                }
                                
                                
                            }else if action.name == "Order medicine"{
                                NavigationLink(destination: OrderMedicine()) {
                                    
                                    ActivityCardView(action: action)
                                }
                            }
                            else if action.name == "Talk to EDITH"{
                                NavigationLink(destination: EdithView()) {
                                    
                                    ActivityCardView(action: action)
                                }
                            }
                            
                            
                            else if action.name == "Quick Diagnostics"{
                                NavigationLink(destination: QuckDiagnostics()) {
                                    
                                    ActivityCardView(action: action)
                                }
                                
                                
                            }else{
                                NavigationLink(destination: DetailView(action: action)) {
                                    
                                    ActivityCardView(action: action)
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .padding(.bottom,edge!.bottom + 50)
            }
        }
    }
}

struct ActivityCardView : View {
    
    var action : QuickActions
    
    var body: some View{
        
        VStack{
            
            VStack{
                
                Image(action.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top,10)
                    .padding(.leading,10)
                    .background(Color.white)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(action.name)
                            .font(.title3)
                    }
                    .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(15)
            
            
            Spacer(minLength: 0)
        }
    }
}

// TabViews...

struct Email : View {
    
    var body: some View{
        
        VStack{
            HStack{
                Text("Your un-read messages")
                    .foregroundColor(Color("Color1"))
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer(minLength: 0)
            }
            .padding()
            Spacer(minLength: 0)

            
            Text("No New messages")
            Spacer(minLength: 0)

        }
    }
}



// Model Data...

struct QuickActions : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var numCourse : Int
    var asset : String
}

// both image and color name is same so i used common word asset...

var actions = [
    
    QuickActions(name: "Quick Diagnostics", numCourse: 12,asset: "Diagnostics"),
    QuickActions(name: "Talk to specialist", numCourse: 12,asset: "specialist"),
    QuickActions(name: "Book an appointment", numCourse: 12,asset: "appointment"),
    QuickActions(name: "Order medicine", numCourse: 12,asset: "medicine"),
    QuickActions(name: "Talk to EDITH", numCourse: 12,asset: "edith")
]

struct DetailView : View {
    
    var action : QuickActions
    
    var body: some View{
        
        VStack{
            
            Text(action.name)
                .font(.title2)
                .fontWeight(.bold)
        }
        .navigationTitle(action.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
            CardButton(image: "questionmark.circle", color: .green)
            
        }))
    }
}
