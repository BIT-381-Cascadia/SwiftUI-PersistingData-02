//
//  Main.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import SwiftUI

struct Main: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddDog()) {
                    Text("Add a Dog")
                }
                    .padding()
                
                NavigationLink(destination: ListAllDogs()) {
                    Text("List All Dogs")
                }
                    .padding()
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
