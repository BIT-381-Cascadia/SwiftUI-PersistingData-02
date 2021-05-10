//
//  UpdateCat.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

//
//  AddDog.swift
//  SwiftUI-PersistingData-02
//
//  Created by Mike Panitz on 5/3/21.
//



import SwiftUI

struct UpdateCat: View {
        
    @State var name: String = ""
    @State var age: String = ""
    
    private var original: Cat = Cat()
    
    init() { }
    
    init(originalCat OC: Cat) {
        self.init()
        original = OC
        name = OC.name
        age = String(OC.age)
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
    
    func updateCatInDB() {
        guard Int(self.age) != nil else {
            print("Age wasn't a number")
            return
        }
        
        showFormElts()
        
        theDataRepo.UpdateCat(id: self.original.id, newName: self.name, newAge: Int(self.age)!)
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(self.original.name + "'s New Info:")) {
                    TextField("Name: \(self.original.name)", text: self.$name)
                    TextField("Age: \(String(self.original.age))", text: self.$age)
                }
                Button(action: updateCatInDB)
                {
                    Text("Update")
                }
            }
            .navigationBarTitle("Update " + self.original.name + "'s info")
        }
    }
}

struct UpdateCat_Previews: PreviewProvider {
    static var previews: some View {
        //UpdateDog(name:"Fido", age:2)
        Text("NOT AVAILABLE AT THIS TIME")
    }
}

