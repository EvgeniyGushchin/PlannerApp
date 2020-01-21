//
//  ContentView.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 20.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: LoginViewModel 
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Planner")
                    .foregroundColor(.blue)
                    .font(.headline)
                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                RoundedButton(title: "Login", action: {
                    print("\(self.username)\n\(self.password)")
                    self.viewModel.login(username: self.username, password: self.password)
                })
                    .padding(.top, 20)
            }
            .padding()
            ActivityIndicator(shouldAnimate: viewModel.isRequesting)
        }
        .modifier(DismissingKeyboard())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
