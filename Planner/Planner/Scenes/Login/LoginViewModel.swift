//
//  LoginViewModel.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 20.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published private(set) var isRequesting = false
    
    func login(username: String, password: String) {
        
        isRequesting = true
        let credentials = InlineObject(username: username, password: password)
        
        DefaultAPI.login(inlineObject: credentials) { (user, error) in
            self.isRequesting = false
            
            //TO DO: save token
        }
    }
    
}
