//
//  AddDog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//



import SwiftUI

struct AddDog: View {
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
    
    func saveDogToDB() {
        guard Int(self.age) != nil else {
            print("Age wasn't a number")
            return
        }
        
        showFormElts()
        
        theDataRepo.saveDog(newName: self.name, newAge: Int(self.age)!)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Dog's Info:")) {
                    TextField("Dog's name", text: $name)
                    TextField("Dog's age", text: $age)
                }
                Button(action: saveDogToDB)
                {
                    Text("Save")
                }
            }
            .navigationBarTitle("Add New Dog")
        }
    }
}

struct AddDog_Previews: PreviewProvider {
    static var previews: some View {
        AddDog()
    }
}
