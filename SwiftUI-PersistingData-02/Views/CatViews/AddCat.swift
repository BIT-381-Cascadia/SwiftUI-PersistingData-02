//
//  AddCat.swift
//  SwiftUI-PersistingData-02
//
//  Created by Natalman Nahm on 5/10/21.
//

import SwiftUI

struct AddCat: View {
    
    @State var catName: String = ""
    @State var catAge: String = ""
    @State var catSex: String = ""
    
    @EnvironmentObject var theDataRepo: DataRepository
    func showFormElts() {
        print("showFormElts")
        print("Name: \(catName)")
        print("age: \(catAge)")
        print("sex: \(catSex)")
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    func saveCatToDB(){
        guard Int(self.catAge) != nil else {
            print("Age has to be a number")
            return
        }
        
        showFormElts()
    
        theDataRepo.saveCat(catName: self.catName, catAge: Int(self.catAge)!, catSex: self.catSex)
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Cat Info:")) {
                    TextField("Name:", text: $catName)
                    TextField("Age:", text: $catAge)
                    
                    TextField("Sex:", text: $catSex)
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
