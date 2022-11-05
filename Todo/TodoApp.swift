//
//  TodoApp.swift
//  Todo
//
//  Created by Mateus Marinho on 04/11/22.
//

import SwiftUI

@main
struct TodoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel )
        }
    }
}
