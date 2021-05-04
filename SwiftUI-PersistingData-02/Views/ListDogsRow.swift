//
//  ListDogsRow.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import SwiftUI

struct ListDogsRow: View {
    
    private let thisDog:Dog
    
    init(theDog:Dog) {
        thisDog = theDog
    }
    
    func noop() {
        
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(thisDog.name)")
                Text("Age: \(String(thisDog.age))")
            }
            Spacer()
            Button(action:noop) {
                Text("Edit")
            }
            Spacer()
            Button(action:noop) {
                Text("Delete")
            }
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

struct ListDogsRow_Previews: PreviewProvider {
    

    static var previews: some View {
        let demoDog = Dog(name: "Fido", age: 3)
        
        ListDogsRow(theDog: demoDog)
    }
}
