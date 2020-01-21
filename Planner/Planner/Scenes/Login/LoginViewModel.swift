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
    
    @Published private(set) var isRequesting = false
    @Published private(set) var isEnabled: Bool = false
    
    @Published var username = ""
    @Published var password = ""
    
    private var worker: AnyCancellable? = nil
    
    init() {
        worker = Publishers.CombineLatest($password, $username)
            .map({ (username, password) -> Bool in
                !username.isEmpty && !password.isEmpty
            })
            .sink { enabled in
                self.isEnabled = enabled
        }
    }
    
    func login() {
        login(username: username, password: password)
    }
    
    func login(username: String, password: String) {
        
        isRequesting = true
        let credentials = InlineObject(username: username, password: password)
        
        DefaultAPI.login(inlineObject: credentials) { (user, error) in
            self.isRequesting = false
            
            //TO DO: save token
        }
    }
    
}
