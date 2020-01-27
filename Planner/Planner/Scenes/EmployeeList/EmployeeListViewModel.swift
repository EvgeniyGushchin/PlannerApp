//
//  EmployeeListViewModel.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation


final class EmployeeListViewModel: ObservableObject {
    
    let authService: AuthService
    
    @Published private(set) var isRequesting = false
    
    init(authenticationService: AuthService) {
        self.authService = authenticationService
//        worker = Publishers.CombineLatest($password, $username)
//            .map({ (username, password) -> Bool in
//                !username.isEmpty && !password.isEmpty
//            })
//            .sink { enabled in
//                self.isEnabled = enabled
//        }
    }
    
    func loadEmployees() {
        
    }
}
