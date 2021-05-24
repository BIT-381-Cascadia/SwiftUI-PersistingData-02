//
//  UpdateKangaroo.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/17/21.
//

import SwiftUI

struct UpdateKangaroo: View {
    
    @State var name: String = ""
    @State var age: String = ""
    
    private var original: Kangaroo = Kangaroo()
    
    init () {}
    
    init(originalKangaroo OK: Kangaroo) {
        self.init()
        original = OK
        name = OK.name
        age = String(OK.age)
    }
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func showFormElts() {
        print("showFormElts")
        print("Name: \(name)")
        print("age: \(age)")
    }
    
    @Environment(\.presentationMode) var presentationMode:
        Binding<PresentationMode>
    
    func updateKangarooInDB() {
        guard Int (self.age) != nil else {
            print("Age was not a number")
            return
        }
        
        showFormElts()
        
        theDataRepo.updateKangaroo(id: self.original.id, newName: self.name, newAge: Int(self.age)!)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(self.original.name + "'s New Info:")) {
                    TextField("Name: \(self.original.name)",text:self.$name)
                    TextField("Age: \(String(self.original.age))", text:self.$age)
                }
                Button(action: updateKangarooInDB)
                {
                    Text("Update")
                }
            }
            .navigationBarTitle("Update " + self.original.name + "'s info")
        }
        
    }
}

struct UpdateKangaroo_Previews: PreviewProvider {
    static var previews: some View {
        UpdateKangaroo()
    }
}
