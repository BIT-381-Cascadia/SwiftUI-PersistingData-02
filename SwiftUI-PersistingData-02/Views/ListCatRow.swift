//
//  ListCatRow.swift
//  SwiftUI-PersistingData-02
//
//  Created by Natalman Nahm on 5/10/21.
//

import SwiftUI

struct ListCatRow: View {
    var mode: CatListMode
    
    
    private let thisCat:Cat
    
    init(cat:Cat, mode:CatListMode) {
        thisCat = cat
        self.mode = mode
    }
    
    func noop() {
        
    }
    
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func deleteCatFromDB() {
        theDataRepo.deleteCat(cat: thisCat)
    }
    
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(thisCat.name)")
                Text("Age: \(String(thisCat.age))")
                Text("Sex: \(String(thisCat.sex))")
            }
            Spacer()
            if mode == .Add {
                Button(action:noop) {
                    Text("Edit")
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

struct ListCatRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let demoCat = Cat(id: UUID().hashValue, name: "Meow", age: 4, sex: "Male")
        
        ListCatRow(cat: demoCat, mode: .Update)
    }
}
