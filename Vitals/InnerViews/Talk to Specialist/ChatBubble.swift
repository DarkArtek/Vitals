//
//  ChatBubble.swift
//  Global Chat
//
//  Created by Aayush Pokharel on 2021-02-06.
// https://github.com/Aayush9029

import SwiftUI

struct ChatBubble: Shape {

    var myMsg : Bool
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,myMsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        
        return Path(path.cgPath)
    }
}

