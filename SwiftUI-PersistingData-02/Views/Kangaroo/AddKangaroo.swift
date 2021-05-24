//
//  AddKangaroo.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

import SwiftUI

struct AddKangaroo: View {
    @State var name: String = ""
    @State var age: String = ""
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    func showFormElts() {
        print("showFormElts")
        print("Name: \(name)")
        print("age: \(age)")
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func saveKangaroo() {
        guard Int(self.age) != nil else {
            print("Age was not a number")
            return
        }
        
        showFormElts()
        
        theDataRepo.saveKangaroo(newName: self.name, newAge: Int(self.age)!)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Kangaroo's Info:")) {
                    TextField("Kangaroo's type", text: $name)
                    TextField("Kangaroo's age", text: $age)
                }
                Button(action: saveKangaroo)
                {
                    Text("Save")
                }
            }
            .navigationBarTitle("Add New Kanagroo to the Zoo")
        }
    }
}

struct AddKangaroo_Previews: PreviewProvider {
    static var previews: some View {
        AddKangaroo()
    }
}
