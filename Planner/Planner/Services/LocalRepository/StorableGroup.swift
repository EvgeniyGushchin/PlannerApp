//
//  StorableGroup.swift
//  Planner
//
//  Created by Evgeniy Gushchin on 23.02.2020.
//  Copyright © 2020 EG. All rights reserved.
//

import Foundation
import RealmSwift

extension Group: Entity {
    private var storableGroup: StorableGroup {
        let realmGroup = StorableGroup()
        realmGroup.uuid = "\(id ?? 0)"
        realmGroup.name = name
        return realmGroup
    }
    
    func toStorable() -> StorableGroup {
        return storableGroup
    }
}

class StorableGroup: Object, Storable {
    
   @objc dynamic var uuid: String = ""
   @objc dynamic var name: String? = ""
    
    var model: Group
    {
        get {
            return Group(id: uuid.intValue ?? 0, name: name)
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
