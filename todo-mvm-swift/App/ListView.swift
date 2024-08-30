//
//  ListView.swift
//  todo-mvm-swift
//
//  Created by Alan Ramalho on 29/08/24.
//

import SwiftUI

// MVVM Arch
// Model View ViewModel

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

//    @State var items: [ItemModel] = [
//        ItemModel(title: "This is the first item.", isCompleted: true),
//        ItemModel(title: "This is the second item.", isCompleted: false),
//        ItemModel(title: "This is the thrird item.", isCompleted: true),
//    ]
    
    var body: some View {
        List {
            ForEach(listViewModel.items) {
                item  in ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.completeItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("Todo list 🗒️")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                "Add",
                destination: AddView()
            )
        )
    }
    
}

#Preview {
    @Previewable @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    NavigationView {
        ListView().environmentObject(listViewModel)
    }
}
