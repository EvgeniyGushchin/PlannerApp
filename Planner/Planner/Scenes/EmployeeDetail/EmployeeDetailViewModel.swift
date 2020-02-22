//
//  EmployeeDetailViewModel.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation


final class EmployeeDetailViewModel {
    
    enum PropertyType {
        case phone
        case skype
        case email
    }
    
    let employee: Employee
    
    let fullName: String
    let department: String
    let group: String
    let email: String
    let skype: String
    let phone: String
    
    init(employee: Employee) {
        self.employee = employee
        self.fullName = employee.fullName ?? ""
        self.department = employee.employeeDepartment?.name ?? ""
        self.group = employee.group?.name ?? ""
        self.email = employee.email ?? ""
        self.skype = employee.skype ?? ""
        self.phone = employee.phoneNumber ?? ""
    }
    
    func urlForProperty(type: PropertyType) -> URL? {
        switch type {
        case .phone:
            return phoneNumber()
        case .skype:
            return skypeUrl()
        case .email:
            return emailUrl()
        }
    }
    
    func urlForAvatar() -> String {
        return Gravatar(emailAddress: employee.email ?? "").url(size: 200).absoluteString
    }
    
    private func phoneNumber() -> URL? {
        
        let dash = CharacterSet(charactersIn: "-")

        let cleanString = phone.trimmingCharacters(in: dash)
        let phoneString = "tel://\(cleanString)"
        
        return URL(string: phoneString)
    }
    
    private func skypeUrl() -> URL? {
        return URL(string: "skype:\(skype)")
    }
    
    private func emailUrl() -> URL? {
        return URL(string: "mailto:\(email)")
    }
}
