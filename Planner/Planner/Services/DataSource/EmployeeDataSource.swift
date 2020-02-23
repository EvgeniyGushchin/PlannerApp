//
//  EmployeeDataSource.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.02.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import Connectivity

class EmployeeDataSource: DataSourceProtocol {
    
    private let localRepository: AnyRepository<Employee>
    private let authToken: String
    private let connectivity = Connectivity()
    
    init(repo: AnyRepository<Employee>, authToken: String) {
        self.localRepository = repo
        self.authToken = authToken
    }
    
    func loadEmployeesList(left: LeftStatus, completion: ((Result<[Employee], Error>) -> Void)?) {
        
        checkConncetion { [weak self] isConnected in
            if isConnected {
                self?.loadFromNetwork(completion: completion)
            }
            else {
                guard let employees = self?.loadFromDB() else {
                    completion?(.failure(DataError.employeesLoadFailed))
                    return
                }
                completion?(.success(employees))
            }
        }
    }
    
    private func loadFromNetwork(left: LeftStatus = .working, completion: ((Result<[Employee], Error>) -> Void)?) {
        DefaultAPI.employees(
            authorization: authToken,
            status: "active",
            _left: "no") { [weak self] (list, error) in
                guard let emlpoyees = list else {
                    completion?(.failure(error ?? DataError.employeesLoadFailed))
                    return
                }
                self?.saveEmployees(employees: emlpoyees)
                completion?(.success(emlpoyees))
        }
    }
    
    private func handleError(error: Error) {
        print(error)
        // TO DO: handle error
    }
    
    // MARK: - Connection Test
    
    private func checkConncetion(completion: @escaping ((Bool) -> Void)) {
        
        connectivity.checkConnectivity { connectivity in
            
            switch connectivity.status {
            case .connected, .connectedViaWiFi, .connectedViaCellular:
                completion(true)
                break
            case .connectedViaWiFiWithoutInternet, .connectedViaCellularWithoutInternet, .notConnected, .determining:
                completion(false)
                break
            }
        }
    }
    
    // MARK: - Local Storage
    
    private func saveEmployees(employees: [Employee]) {
        try? localRepository.bulkInsert(items: employees)
    }
    
    private func loadFromDB() -> [Employee] {
        return localRepository.getAll()
    }
    
    
}
