//
//  AuthService.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

enum AuthError: Error {
    case authenticationFailed
    case keychainError
}

protocol AuthServiceProtocol {
    
    typealias LoginResult = (Result<Bool, AuthError>) -> ()
    
    func login(username: String, password: String, completion: LoginResult?)
}

class AuthService: ObservableObject, AuthServiceProtocol {
    
    @Published private(set) var isAuthorized = false
    
    init() {
        guard let token = KeychainWrapper.standard.string(forKey: "token") else {
            return
        }
        isAuthorized = true
    }
    
    func login(username: String, password: String, completion: LoginResult?) {
        let credentials = InlineObject(username: username, password: password)
        
        DefaultAPI.login(inlineObject: credentials) { (user, error) in
            guard let user = user, let token = user.token else {
                completion?(.failure(.authenticationFailed))
                return
            }
            let saveSuccessful: Bool = KeychainWrapper.standard.set(token, forKey: "token")
            if saveSuccessful {
                self.isAuthorized = true
                completion?(.success(true))
            } else {
                completion?(.failure(.keychainError))
            }
        }
    }
}
