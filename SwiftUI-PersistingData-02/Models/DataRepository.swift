//
//  Repository.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import Foundation
import RealmSwift

class DataRepository: ObservableObject {
    
    init(realm: Realm) {
        // We're not actually doing anything with this
        // but it does show how to initialize a more
        // complicated object
    }
    
    func saveDog(theDog: Dog) {
        objectWillChange.send()
        let realm = try! Realm()

        try! realm.write {
            realm.add(theDog)
        }
    }

    func loadDogs() -> Results<Dog> {
        let realm = try! Realm()
        return realm.objects(Dog.self)
    }
}
