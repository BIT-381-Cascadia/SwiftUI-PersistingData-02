//
//  AddDog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//



import SwiftUI
import RealmSwift

struct ListAllDogs: View {
    @EnvironmentObject var theDataRepo: DataRepository
    
    var body: some View {
        Text("Dog Info:")
        
        ForEach(self.theDataRepo.loadDogs().map(Dog.init), id: \.self) { aDog in
            ListDogsRow(theDog: aDog)
        }
    }
}

struct ListAllDogs_Previews: PreviewProvider {
    static var previews: some View {
        ListAllDogs()
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
