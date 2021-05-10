//
//  ContentView.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
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
                NavigationLink(destination: AddDog()) {
                    Text("Add a Dog")
                }
                    .padding()
                
                NavigationLink(destination: ListAllDogs(whichMode:.List)) {
                    Text("List All Dogs")
                }
                    .padding()

                NavigationLink(destination: ListAllDogs(whichMode: .Update)) {
                    Text("Update A Dog")
                }
                    .padding()
                
                NavigationLink(destination: ListAllDogs(whichMode: .Delete)) {
                    Text("Delete A Dog")
                }
                    .padding()

            }
        }
            .padding()
            .environmentObject(DataRepository(realm: realmObj))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
