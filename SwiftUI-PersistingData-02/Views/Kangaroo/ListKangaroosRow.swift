//
//  ListKangaroosRow.swift
//  SwiftUI-PersistingData-02
//
//  Created by Student Account on 5/10/21.
//

import SwiftUI

struct ListKangaroosRow: View {
    
    var mode: KangarooListMode
    
    private let thisKangaroo:Kangaroo
    
    init(theKangaroo:Kangaroo, mode:KangarooListMode) {
        thisKangaroo = theKangaroo
        self.mode = mode
    }
    
    func noop(){}
    
    @EnvironmentObject var theDataRepo: DataRepository
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name: \(thisKangaroo.name)")
                Text("Age: \(String(thisKangaroo.age))")
            }
            
            Spacer()
            if mode == .Add {
                Button(action:noop) {
                    Text("Edit")
                }
            }
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}


struct ListKangaroosRow_Previews: PreviewProvider {
    
    static var previews: some View {
        let demoKang = Kangaroo(id: UUID().hashValue, name: "Baby", age: 1)
        ListKangaroosRow(theKangaroo: demoKang, mode: .Add)
    }
}

