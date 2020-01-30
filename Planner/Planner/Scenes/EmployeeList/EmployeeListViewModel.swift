//
//  EmployeeListViewModel.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import Combine

final class EmployeeListViewModel: ObservableObject {
    
    let authService: AuthService
    let dataSource: DataSourceProtocol
    
    @Published private(set) var isRequesting = false
    @Published private(set) var employees: [Employee] = []
    
    @Published var username = ""
    
    private var worker: AnyCancellable? = nil
    @Published private var originalEmployees: [Employee] = []
    
    init(authenticationService: AuthService, dataSource: DataSourceProtocol) {
        self.authService = authenticationService
        self.dataSource = dataSource
        
        worker = Publishers.CombineLatest($username, $originalEmployees)
            .sink(receiveValue: { [weak self] (searchname, employees) in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.employees = strongSelf.filterEmployeesBy(username: searchname, employees: employees)
            })
            
    }
    
    func loadEmployees() {
        isRequesting = true
        dataSource.loadEmployeesList(left: .working) { [weak self] result in
            self?.isRequesting = false
            switch result {
            case .success(let employees):
                self?.originalEmployees = employees.filter { (employee) -> Bool in
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
    
    private func filterEmployeesBy(username: String, employees: [Employee]) -> [Employee] {
        if username.count > 0 {
            return employees.filter {
                if let name = $0.fullName {
                    return name.range(of: username, options: .caseInsensitive) != nil
                }
                else {
                    return false
                }
            }
        }
        else {
            return employees
        }
    }
    
    private func handleError(error: Error) {
        print(error)
        // TO DO: handle error
    }
}
