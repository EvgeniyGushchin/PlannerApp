//
//  EmployeeDataSource.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.02.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation

class EmployeeDataSource: DataSourceProtocol {
    
    private let localRepository: AnyRepository<Employee>
    private let authToken: String
    
    init(repo: AnyRepository<Employee>, authToken: String) {
        self.localRepository = repo
        self.authToken = authToken
    }
    
    func loadEmployeesList(left: LeftStatus, completion: ((Result<[Employee], Error>) -> Void)?) {
        loadFromNetwork { [weak self] result in
            switch result {
            case .success(let employees):
                self?.saveEmployees(employees: employees)
                return
            case .failure(let error):
                self?.handleError(error: error)
            }
            completion?(result)
        }
    }
    
    private func loadFromNetwork(left: LeftStatus = .working, completion: ((Result<[Employee], Error>) -> Void)?) {
        DefaultAPI.employees(
            authorization: authToken,
            status: "active",
            _left: "no") { (list, error) in
                guard let emlpoyees = list else {
                    completion?(.failure(error ?? DataError.employeesLoadFailed))
                    return
                }
                completion?(.success(emlpoyees))
        }
    }
    
    private func saveEmployees(employees: [Employee]) {
        
    }
    
    private func loadFromDB() -> [Employee] {
        return localRepository.getAll()
    }
    
    private func handleError(error: Error) {
        print(error)
        // TO DO: handle error
    }
}
