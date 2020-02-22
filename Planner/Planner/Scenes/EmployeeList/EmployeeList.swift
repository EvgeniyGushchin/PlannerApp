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
        
        NavigationView {
            ZStack {
                Color(AppColors.mainColor)
                    .edgesIgnoringSafeArea(.top)
                VStack {
                    TextField("Search by name", text: $viewModel.username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                    List(viewModel.employees) { employee in
                        NavigationLink(
                            destination: LazyView(
                                EmployeeDetail(viewModel: EmployeeDetailViewModel(employee: employee))
                            )
                        ) {
                            EmployeeRow(employee: employee)
                        }
                    }
                    Button(action: {
                        self.authService.logout()
                    }) {
                        HStack {
                            Spacer()
                            Text("Logout")
                                .font(.headline)
                                .foregroundColor(Color.blue)
                            Spacer()
                        }
                    }
                    .padding()
                }
                .background(Color.white)
                .navigationBarTitle(Text("Employees"))
                ActivityIndicator(shouldAnimate: viewModel.isRequesting)
            }
        }
        .onAppear {
            self.viewModel.loadEmployees()
        }
        
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = AppColors.mainColor
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

struct EmployeeList_Previews: PreviewProvider {
    
    static var previews: some View {
        EmployeeList()
            .environmentObject(AuthService())
            .environmentObject(EmployeeListViewModel(
                authenticationService: AuthService(),
                dataSource: SimpleDataSource(authToken: AuthService().token)
            ))
    }
}
