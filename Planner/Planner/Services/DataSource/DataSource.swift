//
//  DataSource.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation


enum DataError: Error {
    case employeesLoadFailed
}

enum LeftStatus: String {
    case working = "no"
    case away = "any"
    case any = "all"
}

protocol DataSourceProtocol {
    func loadEmployeesList(left: LeftStatus, completion: ((Result<[Employee], Error>) -> Void)?)
}

class SimpleDataSource: DataSourceProtocol {
    
    let authToken: String
    
    init(authToken: String) {
        self.authToken = authToken
    }
    
    func loadEmployeesList(left: LeftStatus = .working, completion: ((Result<[Employee], Error>) -> Void)?) {
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
}
