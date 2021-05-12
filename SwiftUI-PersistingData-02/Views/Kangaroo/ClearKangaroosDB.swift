//
//  ClearKangaroosDB.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

import SwiftUI

struct ClearKangaroosDB: View {
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    // To dismiss the screen:
    // https://stackoverflow.com/a/57279591/250610
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func clearDB() {
        theDataRepo.deleteAllDogs()
        
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }

    func cancelDelete() {
        // return to previous screen:
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    var body: some View {
        VStack {
            Text("Are you sure you want to delete all the different Kangaroos?")
            HStack {
                Button(action: clearDB)
                {
                    Text("Yes")
                }
                Spacer()
                Button(action: cancelDelete)
                {
                    Text("No!")
                }

            }
        }
    }
}

struct ClearKangaroosDB_Previews: PreviewProvider {
    static var previews: some View {
        ClearKangaroosDB()
    }
}
