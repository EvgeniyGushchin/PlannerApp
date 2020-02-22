//
//  AppRootView.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import SwiftUI

struct AppRootView: View {

   @EnvironmentObject var authService: AuthService
    
    var body: some View {

        SwiftUI.Group {
            if authService.isAuthorized {
                EmployeeList()
                    .environmentObject(EmployeeListViewModel(
                        authenticationService: authService,
                        dataSource: SimpleDataSource(authToken: authService.token)
                    ))
            } else {
                LoginView().environmentObject(LoginViewModel(authenticationService: authService))
            }
        }
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView().environmentObject(AuthService())
    }
}
