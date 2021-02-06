//
//  Profile.swift
//  Vitals
//
//  Created by Aayush Pokharel on 2021-02-05.
// https://github.com/Aayush9029

import SwiftUI

struct ProfileView: View {
    @Binding var isOpened: Bool
    @State var isQrShown = false
    var body: some View {
        VStack{
            HStack{
              HStack{
                  Image(systemName:"arrow.left")
                  Text("Back")
              }
              .foregroundColor(.white)
              .padding(5)
              .background(Color.blue .opacity(0.5))
              .cornerRadius(5)
              .shadow(color: Color.blue, radius: 5)
              .onTapGesture {
                isOpened.toggle()

              }
                Spacer()
            }.padding(.leading)
            
            Image("profile")
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: 180, height: 180)
                .clipShape(Circle())
                .shadow(radius: 10)

            
            
            VStack{
                Text("Linus Sebiastian")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Age: 28")
                
                VStack {
                    DisclosureGroups()
            
                }
                .padding(.leading)
                
                VStack{
                    Image("qrcode")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .blur(radius: isQrShown ? 0 : 5)
                        .opacity(isQrShown ? 1 : 0.5)

                        .onTapGesture {
                            withAnimation{
                            isQrShown.toggle()
                            }
                        }
                    Spacer()
                    
                    HStack{
                      HStack{
//                          Image(systemName:"arrow.left")
                          Text("Log Out")
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
            .foregroundColor(Color("black-white"))
            
            
            Spacer()
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isOpened: .constant(true))
    }
}



struct DisclosureGroups: View {
    let items: [Bookmark] = [.example1, .example2, .example3, .example4]
    @State private var flags: [Bool] = [false, false, false, false]

    var body: some View {
        List {
            ForEach(Array(items.enumerated()), id: \.1.id) { i, group in
                DisclosureGroup(isExpanded: $flags[i]) {
                    ForEach(group.items ?? []) { item in
                        Label(item.name, systemImage: item.icon)
                        
                    }
                } label: {
                    Label(group.name, systemImage: group.icon)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                self.flags[i].toggle()
                            }
                        }
                }
            }
        }
    }
}


struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let gender = Bookmark(name: "Male", icon: "")
    static let blood = Bookmark(name: "A+", icon: "")
    static let height = Bookmark(name: "1.6m", icon: "")
    static let weight = Bookmark(name: "65Kg", icon: "")
    

    // some example groups
    static let example1 = Bookmark(name: "Gender", icon: "person", items: [Bookmark.gender])
    static let example2 = Bookmark(name: "Blood Type", icon: "heart", items: [Bookmark.blood])
    static let example3 = Bookmark(name: "Height", icon: "ruler", items: [Bookmark.height])
    static let example4 = Bookmark(name: "Weight", icon: "scalemass", items: [Bookmark.weight])
}
