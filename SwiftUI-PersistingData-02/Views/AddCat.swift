//
//  AddDog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//



import SwiftUI

struct AddCat: View {
    @State var name: String = ""
    @State var age: String = ""

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showFormElts() {
        print("showFormElts")
        print("Name: \(name)")
        print("age: \(age)")
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func saveCatToDB() {
        guard Int(self.age) != nil else {
            print("Age wasn't a number")
            return
        }
        
        showFormElts()
        
        theDataRepo.saveCat(newName: self.name, newAge: Int(self.age)!)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Cat's Info:")) {
                    TextField("Cat's name", text: $name)
                    TextField("Cat's age", text: $age)
                }
                Button(action: saveCatToDB)
                {
                    Text("Save")
                }
            }
            .navigationBarTitle("Add New Cat")
        }
    }
}

struct AddCat_Previews: PreviewProvider {
    static var previews: some View {
        AddCat()
    }
}
