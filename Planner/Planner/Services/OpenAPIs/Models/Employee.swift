//
// Employee.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct Employee: Codable, Identifiable {

    public var id: Int
    public var firstName: String?
    public var lastName: String?
    public var fullName: String?
    public var email: String?
    public var skype: String?
    public var phoneNumber: String?
    public var isActive: Bool?
    public var isActiveEmployee: Bool?
    public var dateOfBirth: String?
    public var reportsTo: ReportsTo?
    public var employeeLocation: EmployeeLocation?
    public var employeeDepartment: EmployeeDepartment?
    public var employeeTitle: EmployeeTitle?
    public var group: Group?

    public init(id: Int, firstName: String?, lastName: String?, fullName: String?, email: String?, skype: String?, phoneNumber: String?, isActive: Bool?, isActiveEmployee: Bool?, dateOfBirth: String?, reportsTo: ReportsTo?, employeeLocation: EmployeeLocation?, employeeDepartment: EmployeeDepartment?, employeeTitle: EmployeeTitle?, group: Group?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
        self.email = email
        self.skype = skype
        self.phoneNumber = phoneNumber
        self.isActive = isActive
        self.isActiveEmployee = isActiveEmployee
        self.dateOfBirth = dateOfBirth
        self.reportsTo = reportsTo
        self.employeeLocation = employeeLocation
        self.employeeDepartment = employeeDepartment
        self.employeeTitle = employeeTitle
        self.group = group
    }

    public enum CodingKeys: String, CodingKey { 
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case fullName = "full_name"
        case email
        case skype
        case phoneNumber = "phone_number"
        case isActive = "is_active"
        case isActiveEmployee = "is_active_employee"
        case dateOfBirth = "date_of_birth"
        case reportsTo = "reports_to"
        case employeeLocation = "employee_location"
        case employeeDepartment = "employee_department"
        case employeeTitle = "employee_title"
        case group
    }


}

