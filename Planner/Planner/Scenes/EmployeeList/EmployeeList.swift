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
                    List(viewModel.employees) { employee in
                        NavigationLink(
                            destination: EmployeeDetail(
                                viewModel: EmployeeDetailViewModel(employee: employee)
                        )) {
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
                }
                .navigationBarTitle(Text("Employees"))
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
