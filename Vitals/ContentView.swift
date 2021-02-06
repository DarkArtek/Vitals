//
//  Vitals.swift
//  Vitals
//
//  Created by Aayush Pokharel on 05/02/21.
// https://github.com/Aayush9029

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

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
                
                Settings()
                    .tag("gear")
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
            .background(Color("white-black"))
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
var tabs = ["house","envelope.fill","gear"]

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
                            
                            NavigationLink(destination: DetailView(action: action)) {
                                
                                ActivityCardView(action: action)
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
            
            Text("Email")
        }
    }
}


struct Settings : View {
    
    var body: some View{
        
        VStack{
            
            Text("Settings")
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
    QuickActions(name: "Past Vitals", numCourse: 12,asset: "vitals"),
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
