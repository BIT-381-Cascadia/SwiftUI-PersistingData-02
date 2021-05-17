//
//  ListAllCats.swift
//  SwiftUI-PersistingData-02
//
//  Created by Natalman Nahm on 5/10/21.
//

import SwiftUI
import RealmSwift

struct ListAllCats: View {
    @EnvironmentObject var theDataRepo: DataRepository
    var whichMode: CatListMode
    
    var body: some View {
        VStack {
            Text("Cats Info:")
            
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadCats().map(Cat.init), id: \.self) { aCat in
                    ListCatRow(cat: aCat, mode:whichMode)
                }
            }
        }
    }
}

struct ListAllCats_Previews: PreviewProvider {
    static var previews: some View {
        
        ListAllCats(whichMode: .List)
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
