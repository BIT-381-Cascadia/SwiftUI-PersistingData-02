//
//  ContentView.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    let realm: Realm
    
    init() {
        do {
          realm = try Realm()
        } catch let error {
          // Handle error
          fatalError("Failed to open Realm. Error: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
            Main()
                .padding()
                .environmentObject(DataRepository(realm: realm))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
