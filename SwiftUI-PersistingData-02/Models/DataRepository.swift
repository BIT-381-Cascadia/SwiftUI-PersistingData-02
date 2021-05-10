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
    
    func findADog(name: String) -> Dog? {
        let realm = try! Realm()
        let results = realm.objects(Dog.self).filter("name = " + name)
        if results.count != 1 {
            return nil
        } else {
            // return a 'normal' Dog object, not a Realm Results thingee
            // call the initializer / constructor on the 1 thing in the Results using map
            // remember that .map returns an array
            // so get element 0, the one and only thing in the array
            // then return that
            return results.map(Dog.init)[0]
        }
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
    
    func deleteAllDogs() {
        objectWillChange.send()

        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error {
          // Handle error
          print(error.localizedDescription)
        }
    }
}
