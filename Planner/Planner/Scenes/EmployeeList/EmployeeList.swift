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
    
    var body: some View {
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
    }
}

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeList()
    }
}
