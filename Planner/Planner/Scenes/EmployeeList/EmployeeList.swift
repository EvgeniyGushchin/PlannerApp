//
//  EmployeeList.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct EmployeeList: View {
    
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
                }
                .background(Color.white)
                .navigationBarTitle(Text("Employees"))
                .navigationBarItems(leading:
                    Button(action: {
                        self.viewModel.onLogout()
                    }) {
                        Image(systemName: "arrow.uturn.up")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                )
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
            .environmentObject(EmployeeListViewModel(
                authenticationService: AuthService(),
                dataSource: SimpleDataSource(authToken: AuthService().token)
            ))
    }
}
