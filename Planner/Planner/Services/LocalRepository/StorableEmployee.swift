//
//  StorableEmployee.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.02.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import RealmSwift

extension Employee: Entity {
    private var storableEmployee: StorableEmployee {
        let realmEmployee = StorableEmployee()
        realmEmployee.uuid = "\(id)"
        realmEmployee.firstName = firstName
        realmEmployee.lastName = lastName
        realmEmployee.fullName = fullName
        realmEmployee.email = email
        realmEmployee.skype = skype
        realmEmployee.phoneNumber = phoneNumber
        realmEmployee.dateOfBirth = dateOfBirth
        realmEmployee.isActive.value = isActive
        realmEmployee.isActiveEmployee.value = isActiveEmployee
        realmEmployee.group = group?.toStorable()
        return realmEmployee
    }
    
    func toStorable() -> StorableEmployee {
        return storableEmployee
    }
}

class StorableEmployee: Object, Storable {
    
    @objc dynamic var uuid: String = ""
    @objc dynamic var firstName: String? = ""
    @objc dynamic var lastName: String? = ""
    @objc dynamic var fullName: String? = ""
    @objc dynamic var email: String? = ""
    @objc dynamic var skype: String? = ""
    @objc dynamic var phoneNumber: String?
    @objc dynamic var dateOfBirth: String? = ""
    
    let isActive = RealmOptional<Bool>()
    let isActiveEmployee = RealmOptional<Bool>()
    
    @objc dynamic var group: StorableGroup?
    
    //   @objc dynamic var reportsTo: ReportsTo? = nil
    //   @objc dynamic var employeeLocation: EmployeeLocation?
    //   @objc dynamic var employeeDepartment: EmployeeDepartment?
    //   @objc dynamic var employeeTitle: EmployeeTitle?
    
    
    var model: Employee
    {
        get {
            return Employee(
                id: uuid.intValue ?? 0,
                firstName: firstName,
                lastName: lastName,
                fullName: fullName,
                email: email,
                skype: skype,
                phoneNumber: phoneNumber,
                isActive: isActive.value,
                isActiveEmployee: isActiveEmployee.value,
                dateOfBirth: dateOfBirth,
                reportsTo: nil,
                employeeLocation: nil,
                employeeDepartment: nil,
                employeeTitle: nil,
                group: group?.model
            )
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
