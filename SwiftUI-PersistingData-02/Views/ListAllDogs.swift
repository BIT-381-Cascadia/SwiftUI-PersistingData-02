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
    var whichMode: DogListMode
    
    var body: some View {
        VStack {
            Text("Dog Info:")
            
            // to add a scroll bar:
            // https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadDogs().map(Dog.init), id: \.self) { aDog in
                    ListDogsRow(theDog: aDog, mode:whichMode)
                }
            }
        }
    }
}

struct ListAllDogs_Previews: PreviewProvider {
    static var previews: some View {
        ListAllDogs(whichMode: .List)
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
