//
//  Dog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import Foundation
import RealmSwift

class Dog: Object {
//    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    convenience init(name:String, age:Int) {
        self.init() // call designated init first
        self.name = name
        self.age = age
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
