//
//  EmployeeRow.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct EmployeeRow: View {
    
    var employee: Employee
    
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 7) {
                Text(employee.fullName ?? "")
                    .font(.headline)
                Text(employee.group?.name ?? "")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct EmployeeRow_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI.Group {
            EmployeeRow(employee: Employee(
            id: 0,
            firstName: "John",
            lastName: "Dow",
            fullName: "John Dow",
            email: "test@gmail.com",
            skype: nil,
            phoneNumber: "+79136050099",
            isActive: nil,
            isActiveEmployee: nil,
            dateOfBirth: nil,
            reportsTo: nil,
            employeeLocation: nil,
            employeeDepartment: nil,
            employeeTitle: nil,
            group: Group(id: 0, name: "Dev department")))
            EmployeeRow(employee: Employee(
            id: 0,
            firstName: "John",
            lastName: "Dow",
            fullName: "John Dow",
            email: "test@gmail.com",
            skype: nil,
            phoneNumber: "+79136050099",
            isActive: nil,
            isActiveEmployee: nil,
            dateOfBirth: nil,
            reportsTo: nil,
            employeeLocation: nil,
            employeeDepartment: nil,
            employeeTitle: nil,
            group: Group(id: 0, name: "Dev department")))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
