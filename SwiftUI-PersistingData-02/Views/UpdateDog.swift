//
//  AddDog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//



import SwiftUI

struct UpdateDog: View {
        
    @State var name: String = ""
    @State var age: String = ""
    
    private let original: Dog
    init(originalDog OD: Dog) {
        original = OD
        name = OD.name
        age = String(OD.age)
    }

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showFormElts() {
        print("showFormElts")
        print("Name: \(name)")
        print("age: \(age)")
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func updateDogInDB() {
        guard Int(self.age) != nil else {
            print("Age wasn't a number")
            return
        }
        
        showFormElts()
        
        theDataRepo.updateDog(id: self.original.id, newName: self.name, newAge: Int(self.age)!)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text($name.wrappedValue + "'s New Info:")) {
                    TextField("Dog's name", text: $name)
                    TextField("Dog's age", text: $age)
                }
                Button(action: updateDogInDB)
                {
                    Text("Update")
                }
            }
            .navigationBarTitle("Update " + $name.wrappedValue + "'s info")
        }
    }
}

struct UpdateDog_Previews: PreviewProvider {
    static var previews: some View {
        //UpdateDog(name:"Fido", age:2)
        Text("NOT AVAILABLE AT THIS TIME")
    }
}
