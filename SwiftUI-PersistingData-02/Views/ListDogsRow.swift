//
//  ListDogsRow.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import SwiftUI

struct ListDogsRow: View {
    
    var mode: DogListMode
    
    
    private let thisDog:Dog
    
    init(theDog:Dog, mode:DogListMode) {
        thisDog = theDog
        self.mode = mode
    }
    
    // A "no-op" is an operation that doesn't do anything
    func noop() {
        
    }
    
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func deleteDogFromDB() {
        theDataRepo.deleteDog(theDog: thisDog)
        // Do NOT dismiss the screen, so the user can see the dog disappear (and/or delete more)
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(thisDog.name)")
                Text("Age: \(String(thisDog.age))")
            }
            Spacer()
            if mode == .Add {
                Button(action:noop) {
                    Text("Edit")
                }
            }
            else if mode == .Update {
                NavigationLink(destination: UpdateDog(originalDog:thisDog)) {
                    Text("Update")
                }
            }
            else if mode == .Delete {
                Button(action:deleteDogFromDB) {
                    Text("Delete")
                }
            }
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

struct ListDogsRow_Previews: PreviewProvider {
    

    static var previews: some View {
        let demoDog = Dog(id: UUID().hashValue, name: "Fido", age: 3)
        
        ListDogsRow(theDog: demoDog, mode: .Update)
    }
}
