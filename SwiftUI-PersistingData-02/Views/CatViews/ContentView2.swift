//
//  ContentView2.swift
//  SwiftUI-PersistingData-02
//
//  Created by Natalman Nahm on 5/10/21.
//

import SwiftUI
import RealmSwift

struct ContentView2: View {
    
    let realmObj: Realm
    
    init() {
        do {
          realmObj = try Realm()
        } catch let error {
          // Handle error
          fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddCat()) {
                    Text("Add a Cat")
                }
                .padding()
                
                NavigationLink(destination: ListAllCats(whichMode:.List)) {
                    Text("List All Cats")
                }
                .padding()
                
                NavigationLink(destination: ListAllCats(whichMode: .Update)) {
                    Text("Update A Dog")
                }
                .padding()
                
                NavigationLink(destination: ListAllCats(whichMode: .Delete)) {
                    Text("Delete a Cat")
                }
                .padding()
                
                NavigationLink(destination: ClearDB()) {
                    Text("Clear Database")
                }
                .padding()

            }
        }
            .padding()
            .environmentObject(DataRepository(realm: realmObj))
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
