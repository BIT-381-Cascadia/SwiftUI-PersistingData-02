//
//  Cat.swift
//  SwiftUI-PersistingData-02
//
//  Created by Natalman Nahm on 5/10/21.
//

import Foundation
import RealmSwift

class Cat: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var sex = ""
    convenience init(id: Int, name: String, age: Int, sex: String) {
        self.init()
        self.id = id
        self.name = name
        self.age = age
        self.sex = sex
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
