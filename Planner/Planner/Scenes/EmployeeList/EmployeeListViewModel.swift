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
    let dataSource: DataSourceProtocol
    
    @Published private(set) var isRequesting = false
    @Published private(set) var employees: [Employee] = []
    
    @Published var username = ""
    
    init(authenticationService: AuthService, dataSource: DataSourceProtocol) {
        self.authService = authenticationService
        self.dataSource = dataSource
    }
    
    func loadEmployees() {
        isRequesting = true
        dataSource.loadEmployeesList(left: .working) { [weak self] result in
            self?.isRequesting = false
            switch result {
            case .success(let employees):
                self?.employees = employees.filter { (employee) -> Bool in
                    if let isActive = employee.isActive {
                        return isActive
                    }
                    else {
                        return false
                    }
                }
                return
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }
    
    func handleError(error: Error) {
        print(error)
        // TO DO: handle error
    }
}
