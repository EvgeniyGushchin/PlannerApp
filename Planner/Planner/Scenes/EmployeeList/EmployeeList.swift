//
//  EmployeeList.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct EmployeeList: View {
    
    @EnvironmentObject var authService: AuthService
    @EnvironmentObject var viewModel: EmployeeListViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Text("Hello, World!")
                    Button(action: {
                        self.authService.logout()
                    }) {
                        HStack {
                            Spacer()
                            Text("LOGOUT")
                                .font(.headline)
                                .foregroundColor(Color.blue)
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            ActivityIndicator(shouldAnimate: viewModel.isRequesting)
        }.onAppear {
            self.viewModel.loadEmployees()
        }
    }
}

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeList()
    }
}