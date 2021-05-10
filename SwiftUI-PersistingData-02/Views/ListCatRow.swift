//
//  ListCatRow.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

//
//  ListDogsRow.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//

import SwiftUI

struct ListCatsRow: View {
    
    var mode: CatListMode
    
    
    private let thisCat:Cat
    
    init(theCat:Cat, mode:CatListMode) {
        thisCat = theCat
        self.mode = mode
    }
    
    // A "no-op" is an operation that doesn't do anything
    func noop() {
        
    }
    
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func deleteCatFromDB() {
        theDataRepo.deleteCat(theCat: thisCat)
        // Do NOT dismiss the screen, so the user can see the dog disappear (and/or delete more)
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(thisCat.name)")
                Text("Age: \(String(thisCat.age))")
            }
            Spacer()
            if mode == .Add {
                Button(action:noop) {
                    Text("Edit")
                }
            }
            else if mode == .Update {
                NavigationLink(destination: UpdateCat(originalCat:thisCat)) {
                    Text("Update")
                }
            }
            else if mode == .Delete {
                Button(action:deleteCatFromDB) {
                    Text("Delete")
                }
            }
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

struct ListCatssRow_Previews: PreviewProvider {
    

    static var previews: some View {
        let demoCat = Cat(id: UUID().hashValue, name: "Kitto", age: 3)
        
        ListCatsRow(theCat: demoCat, mode: .Update)
    }
}

