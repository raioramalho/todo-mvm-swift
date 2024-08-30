//
//  ListViewModel.swift
//  todo-mvm-swift
//
//  Created by Alan Ramalho on 29/08/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let data = [
            ItemModel(title: "This is the first item.", isCompleted: true),
            ItemModel(title: "This is the second item.", isCompleted: false),
            ItemModel(title: "This is the thrird item.", isCompleted: true),
        ]
        items.append(contentsOf: data)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func completeItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].toggle()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
}
