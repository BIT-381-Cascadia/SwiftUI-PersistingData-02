//
//  UpdateCat.swift
//  SwiftUI-PersistingData-02
//
//  Created by Natalman Nahm on 5/17/21.
//

import SwiftUI

struct UpdateCat: View {
    
    @State var name: String = ""
    @State var age: String = ""
    @State var sex: String = ""
    
    private var originalCat: Cat = Cat()
    
    init() { }
    
    init(originalCat OC: Cat) {
        self.init()
        originalCat = OC
        name = OC.name
        age = String(OC.age)
        sex = OC.sex
    }

    @EnvironmentObject var theDataRepo: DataRepository
    
    func showFormElts() {
        print("showFormElts")
        print("Name: \(name)")
        print("age: \(age)")
        print("sex: \(sex)")
    }
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func updateCatInDB(){
        guard Int(self.age) != nil else {
            print("Age wasn't a number")
            return
        }
        
        showFormElts()
        theDataRepo.updateCat(id: self.originalCat.id, name: self.name, age: Int(self.age)!, sex: self.sex)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(self.originalCat.name + "'s New Info:")) {
                    TextField("Name: \(self.originalCat.name)", text: self.$name)
                    TextField("Age: \(String(self.originalCat.age))", text: self.$age)
                    TextField("Sex: \(self.originalCat.sex)", text: self.$sex)
                }
                Button(action: updateCatInDB)
                {
                    Text("Update")
                }
                
            }
            .navigationBarTitle("Update " + self.originalCat.name + "'s info")
        }
    }
}

struct UpdateCat_Previews: PreviewProvider {
    static var previews: some View {
        Text("NOT AVAILABLE AT THIS TIME")
    }
}
