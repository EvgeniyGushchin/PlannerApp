//
//  StorableDepartment.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.02.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import RealmSwift

extension EmployeeDepartment: Entity {
    private var storableDepartment: StorableEmployeeDepartment {
        let realmDepartemnt = StorableEmployeeDepartment()
        realmDepartemnt.uuid = "\(id ?? 0)"
        realmDepartemnt.name = name
        realmDepartemnt.alternativeName = alternativeName
        return realmDepartemnt
    }
    
    func toStorable() -> StorableEmployeeDepartment {
        return storableDepartment
    }
}

class StorableEmployeeDepartment: Object, Storable {
    
    @objc dynamic var uuid: String = ""
    @objc dynamic var name: String? = ""
    @objc dynamic var alternativeName: String? = ""
    
    var model: EmployeeDepartment
    {
        get {
            return EmployeeDepartment(id: Int(uuid) ?? 0, name: name, alternativeName: alternativeName)
        }
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}
