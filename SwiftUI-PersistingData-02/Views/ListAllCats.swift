//
//  AddDog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//



import SwiftUI
import RealmSwift

struct ListAllCats: View {
    @EnvironmentObject var theDataRepo: DataRepository
    var whichMode: CatListMode
    
    var body: some View {
        VStack {
            Text("Cat Info:")
            
            // to add a scroll bar:
            // https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadCats().map(Cat.init), id: \.self) { aCat in
                    ListCatsRow(theCat: aCat, mode:whichMode)
                }
            }
        }
    }
}

struct ListAllCats_Previews: PreviewProvider {
    static var previews: some View {
        ListAllDogs(whichMode: .List)
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
