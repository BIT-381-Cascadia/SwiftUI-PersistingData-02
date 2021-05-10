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
    
    func deleteDog(theDog: Dog) {
        objectWillChange.send()

        do {
            // 3
            let realm = try Realm()
            let results = realm.objects(Dog.self).filter( "name = \"" + theDog.name + "\"   ")
            
            if results.count != 1 {
                return
            }

            try realm.write {
                // 4
                realm.delete(results[0])
            }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
}
