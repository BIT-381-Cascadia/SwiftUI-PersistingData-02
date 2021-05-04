//
//  Person.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>()
    convenience init(name: String, pic: Data? = nil) {
        self.init() // call designated init first
        self.name = name
        self.picture = pic
    }
}
