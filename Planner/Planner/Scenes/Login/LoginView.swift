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
    
    var body: some View {
        ZStack {
            VStack {
                Text("Planner")
                    .foregroundColor(.blue)
                    .font(.headline)
                TextField("username", text: Binding<String>(
                    get: { self.viewModel.username },
                    set: { self.viewModel.username = $0 }
                ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                SecureField("password", text: Binding<String>(
                    get: { self.viewModel.password },
                    set: { self.viewModel.password = $0 }
                ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                RoundedButton(title: "Login", action: {
                    self.viewModel.login()
                })
                    .padding(.top, 20)
                    .disabled(!viewModel.isEnabled)
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
