//
//  Kangaroo.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

import Foundation
import RealmSwift

class Kangaroo: Object{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    convenience init(id: Int, name:String, age:Int) {
        self.init()
        self.id = id
        self.name = name
        self.age = age
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

