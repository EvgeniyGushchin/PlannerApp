//
//  ContentView.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 20.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Planner")
                .foregroundColor(.blue)
                .font(.headline)
            TextField("username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            RoundedButton(title: "Login", action: {
                print("\(self.username)\n\(self.password)")
            })
                .padding(.top, 20)
        }
        .padding()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
