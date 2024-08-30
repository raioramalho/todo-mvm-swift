//
//  ListRowView.swift
//  todo-mvm-swift
//
//  Created by Alan Ramalho on 29/08/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(
                systemName: item.isCompleted ? "checkmark.circle" : "circle"
            )
            .foregroundColor(
                item.isCompleted ? .green : .red
            )
            
            
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    
    var item1 = ItemModel(title: "This is the first item.", isCompleted: false)
    var item2 = ItemModel(title: "This is the second item.", isCompleted: false)
    
    Group {
        ListRowView(
            item: item1
        )
        
        ListRowView(
            item: item2
        )
    }
    .previewLayout(.sizeThatFits)
    
}
