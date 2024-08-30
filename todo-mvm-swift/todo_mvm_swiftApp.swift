//
//  todo_mvm_swiftApp.swift
//  todo-mvm-swift
//
//  Created by Alan Ramalho on 29/08/24.
//

import SwiftUI

@main
struct todo_mvm_swiftApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
