//
//  EmployeeDetail.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 27.01.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import SwiftUI

struct EmployeeDetail: View {
    
    let viewModel: EmployeeDetailViewModel
    
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text(viewModel.fullName)
                .font(.headline)
            PropertyView(propertyName: ("Department").self, propertyValue: viewModel.department)
            groupNameView()
            clickablePropertyView(type: .email)
            clickablePropertyView(type: .phone)
            clickablePropertyView(type: .skype)
            Spacer()
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        .navigationBarTitle(Text("Employee"), displayMode: .inline)
    }
    
    func groupNameView() -> PropertyView? {
        if viewModel.group.count > 0 {
            return PropertyView(propertyName: ("Group").self, propertyValue: viewModel.group)
        }
        return nil
    }
    
    func clickablePropertyView(type: EmployeeDetailViewModel.PropertyType) -> ClickablePropertyView? {
        
        var pName = ""
        var pValue = ""
        let pUrl = viewModel.urlForProperty(type: type)
        
        switch type {
        case .phone:
            pName = "Phone"
            pValue = viewModel.phone
            break
        case .skype:
            pName = "Skype"
            pValue = viewModel.skype
            break
        case .email:
            pName = "Email"
            pValue = viewModel.email
            break
        }
        
        if let url = pUrl, !pValue.isEmpty  {
            return ClickablePropertyView(propertyName: pName, propertyValue: pValue, propertyUrl: url)
        }
        
        return nil
    }
}

struct EmployeeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetail(viewModel:
            EmployeeDetailViewModel(
                employee: Employee(
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
                    group: Group(id: 0, name: "Dev department"))))
    }
}
