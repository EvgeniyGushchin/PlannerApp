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
            Image("loginBackground")
                .resizable()
            VStack {
                Text("Planner")
                    .foregroundColor(.white)
                    .font(.custom("KaushanScript-Regular", size: 48))

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
                RoundedButton(title: "Login", color: buttonColor, action: {
                    self.viewModel.login()
                    })
                    .padding(.top, 20)
                    .disabled(!viewModel.isEnabled)
                
            }
            .offset(x: 0, y: -100)
            .padding()
            ActivityIndicator(shouldAnimate: viewModel.isRequesting)
        }
        .modifier(DismissingKeyboard())
        .edgesIgnoringSafeArea([.top, .bottom])
    }
    
    var buttonColor: Color {
        return viewModel.isEnabled ? Color(AppColors.mainColor) : .gray
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(LoginViewModel(authenticationService: AuthService()))
    }
}
