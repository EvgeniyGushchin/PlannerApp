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

/*
 
 How to make protocol with @Published properties????
 
protocol AuthServiceProtocol {
    
    typealias LoginResult = (Result<Bool, AuthError>) -> ()
    
    var isAuthorized: Bool { get }
    
    func login(username: String, password: String, completion: LoginResult?)

}
 */
    
class AuthService: ObservableObject {
    
    private let key = "token"
    private(set) var token = ""
    
    typealias LoginResult = (Result<Bool, AuthError>) -> ()
    
    @Published private(set) var isAuthorized = false
    
    init() {
        guard let token = KeychainWrapper.standard.string(forKey: "token") else {
            return
        }
        self.token = "Token \(token)"
        self.isAuthorized = true
    }
    
    func login(username: String, password: String, completion: LoginResult?) {
        let credentials = InlineObject(username: username, password: password)
        
        DefaultAPI.login(inlineObject: credentials) { (user, error) in
            guard let user = user, let token = user.token else {
                completion?(.failure(.authenticationFailed))
                return
            }
            let saveSuccessful: Bool = KeychainWrapper.standard.set(token, forKey: self.key)
            if saveSuccessful {
                self.token = "Token \(token)"
                self.isAuthorized = true
                completion?(.success(true))
            } else {
                completion?(.failure(.keychainError))
            }
        }
    }
    
    func logout() {
        KeychainWrapper.standard.removeObject(forKey: key)
        isAuthorized = false
    }
        
}
