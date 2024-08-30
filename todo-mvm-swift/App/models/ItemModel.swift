//
//  ItemModel.swift
//  todo-mvm-swift
//
//  Created by Alan Ramalho on 29/08/24.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    var isCompleted: Bool
    
    mutating func toggle() {
        isCompleted.toggle()
    }
}
