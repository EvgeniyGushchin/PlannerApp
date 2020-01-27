//
//  LoginViewModel.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 20.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    let authService: AuthService
    
    @Published private(set) var isRequesting = false
    @Published private(set) var isEnabled = false
    
    @Published var username = ""
    @Published var password = ""
    
    private var worker: AnyCancellable? = nil
    
    init(authenticationService: AuthService) {
        self.authService = authenticationService
        worker = Publishers.CombineLatest($password, $username)
            .map({ (username, password) -> Bool in
                !username.isEmpty && !password.isEmpty
            })
            .sink { enabled in
                self.isEnabled = enabled
        }
    }
    
    func login() {
        isRequesting = true
        authService.login(username: username, password: password) { [weak self] result in
            self?.isRequesting = false
            switch result {
            case .success(_):
                return
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }
    
    func handleError(error: AuthError) {
        print(error)
        // TO DO: handle error
    }
    
}
