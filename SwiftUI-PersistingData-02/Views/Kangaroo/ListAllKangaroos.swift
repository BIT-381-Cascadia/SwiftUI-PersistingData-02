//
//  ListAllKangaroos.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

import SwiftUI
import RealmSwift

struct ListAllKangaroos: View {
    @EnvironmentObject var theDataRepo: DataRepository
    var whichMode: KangarooListMode
    
    
    var body: some View {
        VStack {
            Text("Kangaroo Information:")
            
            ScrollView(.vertical) {
                ForEach(self.theDataRepo.loadKangaroo().map(Kangaroo.init), id: \.self) {
                    aKangaroo in ListKangaroosRow(theKangaroo: aKangaroo, mode:whichMode)
                }
            }
        }
    }
}

struct ListAllKangaroos_Previews: PreviewProvider {
    static var previews: some View {
        ListAllKangaroos(whichMode: .List)
            .environmentObject(DataRepository(realm: try! Realm()))
    }
}
